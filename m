Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB25B8304
	for <lists.iommu@lfdr.de>; Thu, 19 Sep 2019 22:57:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C70A3CBA;
	Thu, 19 Sep 2019 20:57:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 45A75CA8
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 20:57:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 36DFB711
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 20:57:20 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x8JKVeGE135521; Thu, 19 Sep 2019 16:57:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2v4g2u27qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 19 Sep 2019 16:57:15 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8JKhhIo020191;
	Thu, 19 Sep 2019 16:57:14 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
	[169.63.214.131])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2v4g2u27qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 19 Sep 2019 16:57:14 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	x8JKU3Sw019813; Thu, 19 Sep 2019 20:57:13 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
	[9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 2v3vbu2k89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 19 Sep 2019 20:57:13 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
	[9.57.199.109])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x8JKvAd235389736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 19 Sep 2019 20:57:11 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0BC6112062;
	Thu, 19 Sep 2019 20:57:10 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 446ED112063;
	Thu, 19 Sep 2019 20:57:10 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.85.141.73])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 19 Sep 2019 20:57:10 +0000 (GMT)
Subject: Re: [PATCH v4 4/4] vfio: pci: Using a device region to retrieve zPCI
	information
To: Cornelia Huck <cohuck@redhat.com>
References: <1567815231-17940-1-git-send-email-mjrosato@linux.ibm.com>
	<1567815231-17940-5-git-send-email-mjrosato@linux.ibm.com>
	<20190919172505.2eb075f8.cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Openpgp: preference=signencrypt
Message-ID: <c5c5c46e-371b-5be0-064a-b89195cdc3f6@linux.ibm.com>
Date: Thu, 19 Sep 2019 16:57:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919172505.2eb075f8.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1908290000 definitions=main-1909190174
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, walling@linux.ibm.com,
	alex.williamson@redhat.com, kvm@vger.kernel.org,
	sebott@linux.ibm.com, pmorel@linux.ibm.com,
	heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	iommu@lists.linux-foundation.org, robin.murphy@arm.com,
	gerald.schaefer@de.ibm.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 9/19/19 11:25 AM, Cornelia Huck wrote:
> On Fri,  6 Sep 2019 20:13:51 -0400
> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> 
>> From: Pierre Morel <pmorel@linux.ibm.com>
>>
>> We define a new configuration entry for VFIO/PCI, VFIO_PCI_ZDEV
>>
>> When the VFIO_PCI_ZDEV feature is configured we initialize
>> a new device region, VFIO_REGION_SUBTYPE_ZDEV_CLP, to hold
>> the information from the ZPCI device the use
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>  drivers/vfio/pci/Kconfig            |  7 +++
>>  drivers/vfio/pci/Makefile           |  1 +
>>  drivers/vfio/pci/vfio_pci.c         |  9 ++++
>>  drivers/vfio/pci/vfio_pci_private.h | 10 +++++
>>  drivers/vfio/pci/vfio_pci_zdev.c    | 85 +++++++++++++++++++++++++++++++++++++
>>  5 files changed, 112 insertions(+)
>>  create mode 100644 drivers/vfio/pci/vfio_pci_zdev.c
>>
>> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
>> index ac3c1dd..d4562a8 100644
>> --- a/drivers/vfio/pci/Kconfig
>> +++ b/drivers/vfio/pci/Kconfig
>> @@ -45,3 +45,10 @@ config VFIO_PCI_NVLINK2
>>  	depends on VFIO_PCI && PPC_POWERNV
>>  	help
>>  	  VFIO PCI support for P9 Witherspoon machine with NVIDIA V100 GPUs
>> +
>> +config VFIO_PCI_ZDEV
>> +	bool "VFIO PCI Generic for ZPCI devices"
>> +	depends on VFIO_PCI && S390
>> +	default y
>> +	help
>> +	  VFIO PCI support for S390 Z-PCI devices
> 
>>From that description, I'd have no idea whether I'd want that or not.
> Is there any downside to enabling it?
> 

:) Not really, you're just getting information from the hardware vs
using hard-coded defaults.  The only reason I could think of to turn it
off would be if you wanted/needed to restore this hard-coded behavior.

bool "VFIO PCI support for generic ZPCI devices" ?

"Support for sharing ZPCI hardware device information between the host
and guests." ?


>> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
>> index f027f8a..781e080 100644
>> --- a/drivers/vfio/pci/Makefile
>> +++ b/drivers/vfio/pci/Makefile
>> @@ -3,5 +3,6 @@
>>  vfio-pci-y := vfio_pci.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
>>  vfio-pci-$(CONFIG_VFIO_PCI_IGD) += vfio_pci_igd.o
>>  vfio-pci-$(CONFIG_VFIO_PCI_NVLINK2) += vfio_pci_nvlink2.o
>> +vfio-pci-$(CONFIG_VFIO_PCI_ZDEV) += vfio_pci_zdev.o
>>  
>>  obj-$(CONFIG_VFIO_PCI) += vfio-pci.o
>> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
>> index 703948c..b40544a 100644
>> --- a/drivers/vfio/pci/vfio_pci.c
>> +++ b/drivers/vfio/pci/vfio_pci.c
>> @@ -356,6 +356,15 @@ static int vfio_pci_enable(struct vfio_pci_device *vdev)
>>  		}
>>  	}
>>  
>> +	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV)) {
>> +		ret = vfio_pci_zdev_init(vdev);
>> +		if (ret) {
>> +			dev_warn(&vdev->pdev->dev,
>> +				 "Failed to setup ZDEV regions\n");
>> +			goto disable_exit;
>> +		}
>> +	}
>> +
>>  	vfio_pci_probe_mmaps(vdev);
>>  
>>  	return 0;
>> diff --git a/drivers/vfio/pci/vfio_pci_private.h b/drivers/vfio/pci/vfio_pci_private.h
>> index ee6ee91..08e02f5 100644
>> --- a/drivers/vfio/pci/vfio_pci_private.h
>> +++ b/drivers/vfio/pci/vfio_pci_private.h
>> @@ -186,4 +186,14 @@ static inline int vfio_pci_ibm_npu2_init(struct vfio_pci_device *vdev)
>>  	return -ENODEV;
>>  }
>>  #endif
>> +
>> +#ifdef CONFIG_VFIO_PCI_ZDEV
>> +extern int vfio_pci_zdev_init(struct vfio_pci_device *vdev);
>> +#else
>> +static inline int vfio_pci_zdev_init(struct vfio_pci_device *vdev)
>> +{
>> +	return -ENODEV;
> 
> If you really want to have this configurable, why not just return 0
> here and skip the IS_ENABLED check above?
> 

I agree that it functionally has the same result, but in this case I
think Pierre was repeating the same thing the other init() functions
here (IGD, etc) are doing.  Though I guess the other cases have at least
1 other condition they care about besides IS_ENABLED...  OK, I can make
this change.

>> +}
>> +#endif
>> +
>>  #endif /* VFIO_PCI_PRIVATE_H */
> 
> (...)
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
