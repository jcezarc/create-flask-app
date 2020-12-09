from flask_restful import Resource
%import_jwt_required%

from service.%table%_service import %table%Service

class %table%ById(Resource):

    %jwt_decorators_list%

    %jwt_decorator%
    def get(self, %pk_field%):
        """
        Search in  %table% by the field %pk_field%

        #Read
        """
        service = %table%Service()
        return service.find(None, %pk_field%)

    %jwt_decorator%
    def delete(self, %pk_field%):
        """
        Delete a record of %table%

        #Write
        """
        service = %table%Service()
        return service.delete([%pk_field%])
