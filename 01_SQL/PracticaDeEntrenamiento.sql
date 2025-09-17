-- Areas en cuya descripcion este la palabra "tumba" y
-- un estado de conservacion superior a 6

use arqueologia;
select estado
from areas 
where estado >= 6 and description like '%tumba%';

-- Nombre y primer apellido arqueologos que ganen mas de 1000€
-- o que su mail acabe en ".com" o que, no acabando el mail en .com
-- su segundo apellido empiece por 'J'

use arqueologia;
select nombre, ap1
from arqueologos
where salario >= 1000 or mail like '%.com%';

-- Nombre de Excavaciones descubiertas antes del año 1923 o que 
-- siendo descubientas posteriormente a esa fecha su nombre
-- NO contenga una 'S'

use arqueologia;
select nombre
from excavaciones
where fecha < '1923-01-01' or fecha >= '1923-01-01' and nombre not like '%s%';