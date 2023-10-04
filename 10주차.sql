-- SampleDB�����ͺ��̽� / å���̺�, ���ǻ� ���̺�
-- �丮�о� å�� �����ϴ� ���ǻ�� ���

select* from å
select* from ���ǻ�

select ���ǻ��ڵ�
from å
where �о� = '�丮'

-- �������� : �ߺ�����
select ���ǻ��
from ���ǻ�
where ���ǻ��ڵ� in (select ���ǻ��ڵ� from å where �о� in ('�丮','����'))

-- join on : �ߺ�����
select ���ǻ��
from ���ǻ� join å
on å.���ǻ��ڵ� = ���ǻ�.���ǻ��ڵ�
where �о� in ('�丮','����')

-- join on + distinct : �ߺ�����
select distinct ���ǻ��
from ���ǻ� join å
on å.���ǻ��ڵ� = ���ǻ�.���ǻ��ڵ�
where �о� in ('�丮','����')

-- SampleDB / �������̺�
-- ������� �̻� �Ǵ� �л��� �̸� ���
select avg(����) ������� from ����

-- ��������
select �̸�
from ����
where ���� >= (select avg(����) ������� from ����)

-- Ʋ������
select �̸�
from ����
where ���� >= avg(����) -- ����

-- SampleDB / �������̺� 
-- ��ȿ�� �������� ���� �л��� ���
select ���� from ����
where �̸� = '��ȿ��'

select �̸� from ����
where ���� > (select ���� from ���� where �̸� = '��ȿ��')

-- pubs�����ͺ��̽� / sales���̺�� titles���̺�
-- ��� qty �̻��� qty�� title�� ���
select * from sales
select* from titles

select avg(qty) ���qty from sales

select title_id from sales
where qty >= (select avg(qty) ���qty from sales)

--��������
select title ��������
from titles
where title_id in (select title_id from sales where qty >= (select avg(qty) ���qty from sales))

-- join on + distinct
select distinct title join��
from titles join sales
on titles.title_id = sales.title_id
where qty >= (select avg(qty) ���qty from sales)

-- ������� ��������
-- SampleDB / ������ ���̺�
-- �� ���� ���� ���� ������ �л����� ���̸�, �̸�, ���� ���
select ���̸�, �̸�, ���� from ������

select max(����) �����������
from ������ 
where ���̸� = '����Ʈ'

select max(����) �����������
from ������ 
where ���̸� = '������'

select max(����) �����������
from ������ 
where ���̸� = '������'

select max(����) �����������
from ������ 
where ���̸� = '�б�¯'

select max(����) �����������
from ������ 
where ���̸� = '���ѵ���'

-- ������� : ���� ���̺������� �̸��� �ٸ��� �ؼ� ��
select s1.���̸�, s1.�̸�, s1.����
from ������ s1 
where s1.���� = 
(select max(����) ����������� from ������ s2 
where s2.���̸� = s1.���̸� ) 

-- pubs / sales ���̺�
-- �� ������ �ִ��Ǹŷ� ���
select qty, stor_id from sales

select s1.qty, s1.stor_id, s1.title_id from sales s1
where s1.qty = 
(select max(qty)
from sales s2 
where s2.stor_id = s1.stor_id ) 

-- employee ���̺�
-- pub_id ���� ���� ���� job_lvl�� ���� ����� emp_id,pub_id,job_lvl ���
select * from employee

select s1.emp_id, s1.pub_id, s1.job_lvl from employee s1
where s1.job_lvl =
(select max(job_lvl)
from employee s2 
where s2.pub_id = s1.pub_id ) 
