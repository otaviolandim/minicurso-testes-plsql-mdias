create or replace PACKAGE WSH_TRIP_STOPS_PUB AUTHID CURRENT_USER as

TYPE Trip_Stop_Pub_Rec_Type IS RECORD (
 	STOP_ID                         NUMBER DEFAULT FND_API.G_MISS_NUM,
 	TRIP_ID                         NUMBER DEFAULT FND_API.G_MISS_NUM,
	TRIP_NAME                       VARCHAR2(30) DEFAULT FND_API.G_MISS_CHAR,
 	STOP_LOCATION_ID                NUMBER DEFAULT FND_API.G_MISS_NUM,
 	STOP_SEQUENCE_NUMBER            NUMBER DEFAULT FND_API.G_MISS_NUM,
	STOP_LOCATION_CODE              wsh_locations.UI_LOCATION_CODE%TYPE DEFAULT FND_API.G_MISS_CHAR,
 	PLANNED_ARRIVAL_DATE            DATE DEFAULT FND_API.G_MISS_DATE,
 	PLANNED_DEPARTURE_DATE          DATE DEFAULT FND_API.G_MISS_DATE,
 	ACTUAL_ARRIVAL_DATE             DATE DEFAULT FND_API.G_MISS_DATE,
 	ACTUAL_DEPARTURE_DATE           DATE DEFAULT FND_API.G_MISS_DATE,
 	DEPARTURE_GROSS_WEIGHT          NUMBER DEFAULT FND_API.G_MISS_NUM,
 	DEPARTURE_NET_WEIGHT            NUMBER DEFAULT FND_API.G_MISS_NUM,
 	WEIGHT_UOM_CODE                 VARCHAR2(3) DEFAULT FND_API.G_MISS_CHAR,
	WEIGHT_UOM_DESC                 VARCHAR2(25) DEFAULT FND_API.G_MISS_CHAR,
 	DEPARTURE_VOLUME                NUMBER DEFAULT FND_API.G_MISS_NUM,
 	VOLUME_UOM_CODE                 VARCHAR2(3) DEFAULT FND_API.G_MISS_CHAR,
	VOLUME_UOM_DESC                 VARCHAR2(25) DEFAULT FND_API.G_MISS_CHAR,
 	DEPARTURE_SEAL_CODE             VARCHAR2(30) DEFAULT FND_API.G_MISS_CHAR,
 	DEPARTURE_FILL_PERCENT          NUMBER DEFAULT FND_API.G_MISS_NUM,
 	TP_ATTRIBUTE_CATEGORY           VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE1                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE2                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE3                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE4                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE5                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE6                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE7                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE8                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE9                   VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE10                  VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE11                  VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE12                  VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE13                  VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE14                  VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	TP_ATTRIBUTE15                  VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE_CATEGORY              VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE1                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE2                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE3                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE4                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE5                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE6                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE7                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE8                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE9                      VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE10                     VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE11                     VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE12                     VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE13                     VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE14                     VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	ATTRIBUTE15                     VARCHAR2(150) DEFAULT FND_API.G_MISS_CHAR,
 	CREATION_DATE                   DATE DEFAULT FND_API.G_MISS_DATE,
 	CREATED_BY                      NUMBER DEFAULT FND_API.G_MISS_NUM,
 	LAST_UPDATE_DATE                DATE DEFAULT FND_API.G_MISS_DATE,
 	LAST_UPDATED_BY                 NUMBER DEFAULT FND_API.G_MISS_NUM,
 	LAST_UPDATE_LOGIN               NUMBER DEFAULT FND_API.G_MISS_NUM,
 	PROGRAM_APPLICATION_ID          NUMBER DEFAULT FND_API.G_MISS_NUM,
 	PROGRAM_ID                      NUMBER DEFAULT FND_API.G_MISS_NUM,
 	PROGRAM_UPDATE_DATE             DATE DEFAULT FND_API.G_MISS_DATE,
 	REQUEST_ID                      NUMBER DEFAULT FND_API.G_MISS_NUM,
 	PHYSICAL_LOCATION_ID            NUMBER DEFAULT FND_API.G_MISS_NUM,
 	PHYSICAL_STOP_ID                NUMBER DEFAULT FND_API.G_MISS_NUM);

  PROCEDURE Create_Update_Stop
  ( p_api_version_number     IN   NUMBER,
    p_init_msg_list          IN   VARCHAR2,
    x_return_status          OUT NOCOPY   VARCHAR2,
    x_msg_count              OUT NOCOPY   NUMBER,
    x_msg_data               OUT NOCOPY   VARCHAR2,
    p_action_code            IN   VARCHAR2,
    p_stop_info	         IN OUT NOCOPY   Trip_Stop_Pub_Rec_Type,
    p_trip_id                IN   NUMBER DEFAULT FND_API.G_MISS_NUM,
    p_trip_name              IN   VARCHAR2 DEFAULT FND_API.G_MISS_CHAR,
    p_stop_location_id       IN   NUMBER DEFAULT FND_API.G_MISS_NUM,
    p_stop_location_code     IN   VARCHAR2 DEFAULT FND_API.G_MISS_CHAR,
    p_planned_dep_date       IN   DATE DEFAULT FND_API.G_MISS_DATE,
    x_stop_id                OUT NOCOPY   NUMBER);

END WSH_TRIP_STOPS_PUB;
/

create or replace PACKAGE BODY WSH_TRIP_STOPS_PUB as

	PROCEDURE Create_Update_Stop
  ( p_api_version_number     IN   NUMBER,
    p_init_msg_list          IN   VARCHAR2,
    x_return_status          OUT NOCOPY   VARCHAR2,
    x_msg_count              OUT NOCOPY   NUMBER,
    x_msg_data               OUT NOCOPY   VARCHAR2,
    p_action_code            IN   VARCHAR2,
    p_stop_info	             IN OUT NOCOPY   Trip_Stop_Pub_Rec_Type,
    p_trip_id                IN   NUMBER DEFAULT FND_API.G_MISS_NUM,
    p_trip_name              IN   VARCHAR2 DEFAULT FND_API.G_MISS_CHAR,
    p_stop_location_id       IN   NUMBER DEFAULT FND_API.G_MISS_NUM,
    p_stop_location_code     IN   VARCHAR2 DEFAULT FND_API.G_MISS_CHAR,
    p_planned_dep_date       IN   DATE DEFAULT FND_API.G_MISS_DATE,
    x_stop_id                OUT NOCOPY   NUMBER) IS
    begin
	    null;
	end;

END WSH_TRIP_STOPS_PUB;