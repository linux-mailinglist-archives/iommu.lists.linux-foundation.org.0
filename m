Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD546EA5F
	for <lists.iommu@lfdr.de>; Thu,  9 Dec 2021 15:51:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BA1A61258;
	Thu,  9 Dec 2021 14:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEWj0_7zdHq2; Thu,  9 Dec 2021 14:51:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1546061257;
	Thu,  9 Dec 2021 14:51:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADF2EC0012;
	Thu,  9 Dec 2021 14:51:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 984D7C0012
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 08:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E27981D0C
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 08:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=microsoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0ekEUb0DONR for <iommu@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 08:14:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazlp17010001.outbound.protection.outlook.com [40.93.13.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42DB281D02
 for <iommu@lists.linux-foundation.org>; Thu,  9 Dec 2021 08:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xbr6dabkWIx7fIib3/lnsHxtolFrVqZ/hrAvhQG1cEN6txZGm8eY9PDRO/Ib8YalDmaUXHX7ZOx1Mem4trr9forMu0R+vAKLDoWD2csh7u61YfISy+Dv/Vossg+guriMq/gThJvwWfP99tPU9Qj236HXlBr64ZwpXGjWApRJP6KTDsE7e6d4jji6TuHJrbWGrhTFYsMqazJ6ofjiPqytL2Sw68/6FZ8exfwZNjQDB74QjBgDlkIoqORw0fUS9jnEdJ5dLmXwAvBGl7VtEzJTJcnAh8eTzhPmFmTjVh7gGkah+lNwCjKKkV9JSmkTnE+breXP2GokIlBjMqpdsvGmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pYfuxx9XaLF/ir07erjUL+58rdUqyRH1Ku1mItBe+Y=;
 b=TeUELVMizASxh8SSC3W989pEzc7TKnglRnUGDa4H1RXjWZvvVQw1xUlzPQDSwj94QHr0hQjLLMEXTXK5zu381+re2RJ/Zn9WspIw35PgzwWDEMRhGd9HYDh5SdQLWw5bKyYZ1HtqtU26VDD7zF8HekHPe3JIrVaJQRp4C5JWrdcQTWHHNsiRbr3tWTiE027Dw/TCiPaQg+nw9+vJmw+bzQlFfrcbLJMAyH6otMeWXcQS8YT/rKWKbkiltwEZ4oVn49dhaB/FV849GGV1mB3Vggy+PxfYJL9HScRaV9Vg/Che9uMSOFAb4/I9BMoj+WajbCZ9WfPfmKidWpZsGkF/kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pYfuxx9XaLF/ir07erjUL+58rdUqyRH1Ku1mItBe+Y=;
 b=amvOnwCjDM57AhzF6k2EYrw0qa5H9gHP34EacgGCKZUY+Q4mxwOJEHfpOdrUCIHZjRIOp/Vj+GSgIbidtl/V8PasY8K/bd4mdoKwm8qGY7WUxCvBxeyAOKzcNnrBM/oDZWtHLs1LXpev3dfHEWfrXX6rm5Lo9rLsOeLYilpGsKw=
Received: from BY5PR21MB1506.namprd21.prod.outlook.com (20.180.35.76) by
 BYAPR21MB1686.namprd21.prod.outlook.com (52.135.222.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.7; Thu, 9 Dec 2021 08:00:26 +0000
Received: from BY5PR21MB1506.namprd21.prod.outlook.com
 ([fe80::1db2:a482:d774:93ea]) by BY5PR21MB1506.namprd21.prod.outlook.com
 ([fe80::1db2:a482:d774:93ea%3]) with mapi id 15.20.4713.004; Thu, 9 Dec 2021
 08:00:26 +0000
To: Tianyu Lan <ltykernel@gmail.com>, KY Srinivasan <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan
 Cui <decui@microsoft.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
 <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net"
 <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "hch@infradead.org" <hch@infradead.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, "thomas.lendacky@amd.com"
 <thomas.lendacky@amd.com>, "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: RE: [PATCH V6 4/5] scsi: storvsc: Add Isolation VM support for
 storvsc driver
Thread-Topic: [PATCH V6 4/5] scsi: storvsc: Add Isolation VM support for
 storvsc driver
Thread-Index: AQHX6z/0MdbPZMb29kOxpYi7UQICZqwpzfxg
Date: Thu, 9 Dec 2021 08:00:25 +0000
Message-ID: <BY5PR21MB1506535EF9222ED4300C38BBCE709@BY5PR21MB1506.namprd21.prod.outlook.com>
References: <20211207075602.2452-1-ltykernel@gmail.com>
 <20211207075602.2452-5-ltykernel@gmail.com>
In-Reply-To: <20211207075602.2452-5-ltykernel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=425896c8-41fc-478c-aa48-5910dd9b0060;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-12-09T07:56:16Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6bc52d8-8958-43d0-2845-08d9bae9f59d
x-ms-traffictypediagnostic: BYAPR21MB1686:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <BYAPR21MB168676257E98D71DCAFF639DCE709@BYAPR21MB1686.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VqkO6j6Nlp7CadSqBY/stSqWbBjicTpnSfelqHt+KXA+RgeBiD2dTfUNCQHHXAjMQ55jMUqBu7xuDjS76OLm38gCaU18T9tJXBGV/DFXwSZqIncEtOTHQ58DdzZRWwRxZACqMSIXf3FKBpVQ7ARa6eLdY7dg1d4OONYNIRfIqU4//TdRvbixyIU2E0wlKL8Jvc5YrJOS3fqal3NtiVEDoEuVdXrYGuhcd6xxmjFUO2B77zt4+DgjWq69Tg+2S/SkzE4kkJqbbFK+Ky9GP0pRNv3P5ozHXOWEIfQI7Xsgc9tRJfnUnsXY1RK19NnY9kNp7Z2aL79YqJUcuxMK2yCDhBpZRGO5yx27RhxthPVU80oZb6eDhWu37cF2CJAN6JgTiCyt4nHtFunpdxgbezP4U+PO9PLJwwKHbyBT4k//M5O4aZuBQXAECzZriDYjMsbAfDLloJSv12g99VXadrxwPwnsJQS/fKvzpbZQfwMrr2uXWyk0+PLXQ+jBKs6BPDYTjeL2sHf0PkVwBp4LRBKB0P0Cyr7eRtXX0KPNHquyLZKV3YEgVAK5HmHzsj0HMIZAMX55KmudZSA+SK2wcOkmoCWloEW7bqq2Zi15oKVgHg4XEag5YYGsi72IbCihKV3jjA8eD/4rZ0BjOumuiWtQQacNEVywx3yCy5YqwnA08/NP2s90zyzC2qms+Qj9waAz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR21MB1506.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(64756008)(122000001)(66476007)(9686003)(4326008)(52536014)(38070700005)(82960400001)(2906002)(82950400001)(921005)(66446008)(8676002)(7696005)(66556008)(10290500003)(38100700002)(186003)(8936002)(5660300002)(26005)(83380400001)(76116006)(66946007)(71200400001)(508600001)(33656002)(8990500004)(6636002)(54906003)(316002)(110136005)(55016003)(6506007)(7406005)(7416002)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: Lhjr5R2D8mbk2c2OmkkjVCMlNl+utiNl9e+rNDwguL21XzFeqFbGBcjZxc6O15bcvQB4T2UDeY/M6AsnqvqMSKLYAp4E8WjW3Xu0h8Oy3jFCu30pKHvimghhR5w9Ra3Jbr++RTo+/v9taNdBD2n/eg4eOtu3qOTgX3WWlUP9r0BW0nT+7/BTKCKVRaimiZS4FETigK+Dx9Dn5xCIcgVG/hZtfwsGYHxbnNszS+AXTyZFyRDvfTDoMh5o1miL7s/UqetvtfWvDakud06nl7qtjzwyRWWkMzIXCQkk4WsM/lfPIaF93MJEGUj/+YWh90gOFTcgkOhl6jZQ696lgBpUSQVUqZ2WRj8l05Cf+589tzgpZFmemJ9zFOVvFk+GJVhifapSHx9owmVNE0wpyWvMATyDKjASfF4y/PdCsK3SUmHriSOYRtstE0D/nn35ePzC
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR21MB1506.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bc52d8-8958-43d0-2845-08d9bae9f59d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 08:00:25.9444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7aAFTXlz0zNjvj2qVhv59UfE/+fVp4swHV262b9vwMpDk+cXWj4wmrqMaqei5iXqw7vJmQqVH1vb9giytQQwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1686
X-Mailman-Approved-At: Thu, 09 Dec 2021 14:51:30 +0000
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 vkuznets <vkuznets@redhat.com>, "hch@lst.de" <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
From: Long Li via iommu <iommu@lists.linux-foundation.org>
Reply-To: Long Li <longli@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> Subject: [PATCH V6 4/5] scsi: storvsc: Add Isolation VM support for storvsc driver
> 
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> In Isolation VM, all shared memory with host needs to mark visible to host via
> hvcall. vmbus_establish_gpadl() has already done it for storvsc rx/tx ring buffer.
> The page buffer used by vmbus_sendpacket_
> mpb_desc() still needs to be handled. Use DMA API(scsi_dma_map/unmap) to
> map these memory during sending/receiving packet and return swiotlb bounce
> buffer dma address. In Isolation VM, swiotlb  bounce buffer is marked to be
> visible to host and the swiotlb force mode is enabled.
> 
> Set device's dma min align mask to HV_HYP_PAGE_SIZE - 1 in order to keep the
> original data offset in the bounce buffer.
> 
> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> ---
>  drivers/hv/vmbus_drv.c     |  4 ++++
>  drivers/scsi/storvsc_drv.c | 37 +++++++++++++++++++++----------------
>  include/linux/hyperv.h     |  1 +
>  3 files changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c index
> 392c1ac4f819..ae6ec503399a 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -33,6 +33,7 @@
>  #include <linux/random.h>
>  #include <linux/kernel.h>
>  #include <linux/syscore_ops.h>
> +#include <linux/dma-map-ops.h>
>  #include <clocksource/hyperv_timer.h>
>  #include "hyperv_vmbus.h"
> 
> @@ -2078,6 +2079,7 @@ struct hv_device *vmbus_device_create(const guid_t
> *type,
>  	return child_device_obj;
>  }
> 
> +static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
>  /*
>   * vmbus_device_register - Register the child device
>   */
> @@ -2118,6 +2120,8 @@ int vmbus_device_register(struct hv_device
> *child_device_obj)
>  	}
>  	hv_debug_add_dev_dir(child_device_obj);
> 
> +	child_device_obj->device.dma_mask = &vmbus_dma_mask;
> +	child_device_obj->device.dma_parms = &child_device_obj->dma_parms;
>  	return 0;
> 
>  err_kset_unregister:
> diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c index
> 20595c0ba0ae..ae293600d799 100644
> --- a/drivers/scsi/storvsc_drv.c
> +++ b/drivers/scsi/storvsc_drv.c
> @@ -21,6 +21,8 @@
>  #include <linux/device.h>
>  #include <linux/hyperv.h>
>  #include <linux/blkdev.h>
> +#include <linux/dma-mapping.h>
> +
>  #include <scsi/scsi.h>
>  #include <scsi/scsi_cmnd.h>
>  #include <scsi/scsi_host.h>
> @@ -1336,6 +1338,7 @@ static void storvsc_on_channel_callback(void
> *context)
>  					continue;
>  				}
>  				request = (struct storvsc_cmd_request
> *)scsi_cmd_priv(scmnd);
> +				scsi_dma_unmap(scmnd);
>  			}
> 
>  			storvsc_on_receive(stor_device, packet, request); @@
> -1749,7 +1752,6 @@ static int storvsc_queuecommand(struct Scsi_Host *host,
> struct scsi_cmnd *scmnd)
>  	struct hv_host_device *host_dev = shost_priv(host);
>  	struct hv_device *dev = host_dev->dev;
>  	struct storvsc_cmd_request *cmd_request = scsi_cmd_priv(scmnd);
> -	int i;
>  	struct scatterlist *sgl;
>  	unsigned int sg_count;
>  	struct vmscsi_request *vm_srb;
> @@ -1831,10 +1833,11 @@ static int storvsc_queuecommand(struct Scsi_Host
> *host, struct scsi_cmnd *scmnd)
>  	payload_sz = sizeof(cmd_request->mpb);
> 
>  	if (sg_count) {
> -		unsigned int hvpgoff, hvpfns_to_add;
>  		unsigned long offset_in_hvpg = offset_in_hvpage(sgl->offset);
>  		unsigned int hvpg_count = HVPFN_UP(offset_in_hvpg + length);
> -		u64 hvpfn;
> +		struct scatterlist *sg;
> +		unsigned long hvpfn, hvpfns_to_add;
> +		int j, i = 0;
> 
>  		if (hvpg_count > MAX_PAGE_BUFFER_COUNT) {
> 
> @@ -1848,21 +1851,22 @@ static int storvsc_queuecommand(struct Scsi_Host
> *host, struct scsi_cmnd *scmnd)
>  		payload->range.len = length;
>  		payload->range.offset = offset_in_hvpg;
> 
> +		sg_count = scsi_dma_map(scmnd);
> +		if (sg_count < 0)
> +			return SCSI_MLQUEUE_DEVICE_BUSY;

Hi Tianyu,

This patch (and this patch series) unconditionally adds code for dealing with DMA addresses for all VMs, including non-isolation VMs.

Does this add performance penalty for VMs that don't require isolation?

Long

> 
> -		for (i = 0; sgl != NULL; sgl = sg_next(sgl)) {
> +		for_each_sg(sgl, sg, sg_count, j) {
>  			/*
> -			 * Init values for the current sgl entry. hvpgoff
> -			 * and hvpfns_to_add are in units of Hyper-V size
> -			 * pages. Handling the PAGE_SIZE !=
> HV_HYP_PAGE_SIZE
> -			 * case also handles values of sgl->offset that are
> -			 * larger than PAGE_SIZE. Such offsets are handled
> -			 * even on other than the first sgl entry, provided
> -			 * they are a multiple of PAGE_SIZE.
> +			 * Init values for the current sgl entry. hvpfns_to_add
> +			 * is in units of Hyper-V size pages. Handling the
> +			 * PAGE_SIZE != HV_HYP_PAGE_SIZE case also handles
> +			 * values of sgl->offset that are larger than PAGE_SIZE.
> +			 * Such offsets are handled even on other than the first
> +			 * sgl entry, provided they are a multiple of PAGE_SIZE.
>  			 */
> -			hvpgoff = HVPFN_DOWN(sgl->offset);
> -			hvpfn = page_to_hvpfn(sg_page(sgl)) + hvpgoff;
> -			hvpfns_to_add =	HVPFN_UP(sgl->offset + sgl-
> >length) -
> -						hvpgoff;
> +			hvpfn = HVPFN_DOWN(sg_dma_address(sg));
> +			hvpfns_to_add = HVPFN_UP(sg_dma_address(sg) +
> +						 sg_dma_len(sg)) - hvpfn;
> 
>  			/*
>  			 * Fill the next portion of the PFN array with @@ -
> 1872,7 +1876,7 @@ static int storvsc_queuecommand(struct Scsi_Host *host,
> struct scsi_cmnd *scmnd)
>  			 * the PFN array is filled.
>  			 */
>  			while (hvpfns_to_add--)
> -				payload->range.pfn_array[i++] =	hvpfn++;
> +				payload->range.pfn_array[i++] = hvpfn++;
>  		}
>  	}
> 
> @@ -2016,6 +2020,7 @@ static int storvsc_probe(struct hv_device *device,
>  	stor_device->vmscsi_size_delta = sizeof(struct vmscsi_win8_extension);
>  	spin_lock_init(&stor_device->lock);
>  	hv_set_drvdata(device, stor_device);
> +	dma_set_min_align_mask(&device->device, HV_HYP_PAGE_SIZE - 1);
> 
>  	stor_device->port_number = host->host_no;
>  	ret = storvsc_connect_to_vsp(device, storvsc_ringbuffer_size, is_fc);
> diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h index
> 1f037e114dc8..74f5e92f91a0 100644
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@ -1261,6 +1261,7 @@ struct hv_device {
> 
>  	struct vmbus_channel *channel;
>  	struct kset	     *channels_kset;
> +	struct device_dma_parameters dma_parms;
> 
>  	/* place holder to keep track of the dir for hv device in debugfs */
>  	struct dentry *debug_dir;
> --
> 2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
