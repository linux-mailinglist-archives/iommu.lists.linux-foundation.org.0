Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E425B08A
	for <lists.iommu@lfdr.de>; Wed,  2 Sep 2020 18:01:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B60786DAC;
	Wed,  2 Sep 2020 16:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09gCkcsDOEfX; Wed,  2 Sep 2020 16:01:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBD8F8717B;
	Wed,  2 Sep 2020 16:01:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA531C0051;
	Wed,  2 Sep 2020 16:01:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4A50C0051
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 15:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C39488726D
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 15:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SW7PJcgpSEF0 for <iommu@lists.linux-foundation.org>;
 Wed,  2 Sep 2020 15:27:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 06FF186F3F
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 15:27:08 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 082FF2YH056382;
 Wed, 2 Sep 2020 15:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7mXV32r5WePgEqMjkjtjpSfMQCIPNlhHlW2fZ3SX8iQ=;
 b=y3kpXiR6YF9xZQ9hHoCoVTSPxO+FfvCQYqpEjsVslFRjqX5dkvFb0ASrLwArCCGZo1Gf
 s/c7XUeWuUvYYuh74+XMkHWm205a4lcO8jNEjy6JVP9SszCEP02aNyqhtbpF20cW5Sbb
 s5XunusU62ASPdJDA6IhmdKDBjfKEdfWTYzOuUyr7YNDJszct7ncGewYn3f3Z5Xn0KXk
 ARJ+c+Nloc+HPjB/CMhREjbDih8RSxb+XnCifbS4n2brpfjv5vyIS7M8ovboLSmKCAsr
 AdPZ3ecLm3QqOoapgb2jOsIG54UZ9n5Pr9y/bfQ+G/+IEgm8AcqfPEraFbpX7hSHW6Mr 7Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 337eer3adr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 02 Sep 2020 15:27:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 082FPUMv115239;
 Wed, 2 Sep 2020 15:27:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 3380kq640u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Sep 2020 15:27:03 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 082FR2iH032138;
 Wed, 2 Sep 2020 15:27:02 GMT
Received: from [10.175.214.7] (/10.175.214.7)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 02 Sep 2020 08:27:02 -0700
Subject: Re: [PATCH 2/2] iommu: amd: Use cmpxchg_double() when updating
 128-bit IRTE
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20200902045110.4679-1-suravee.suthikulpanit@amd.com>
 <20200902045110.4679-3-suravee.suthikulpanit@amd.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <6f65bd13-08fc-45d9-8e80-b64499f010e0@oracle.com>
Date: Wed, 2 Sep 2020 16:26:57 +0100
MIME-Version: 1.0
In-Reply-To: <20200902045110.4679-3-suravee.suthikulpanit@amd.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9732
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=1 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009020147
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9732
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009020146
X-Mailman-Approved-At: Wed, 02 Sep 2020 16:01:47 +0000
Cc: jon.grimm@amd.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, james.puthukattukaran@oracle.com,
 boris.ostrovsky@oracle.com, sean.m.osborne@oracle.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 9/2/20 5:51 AM, Suravee Suthikulpanit wrote:
> When using 128-bit interrupt-remapping table entry (IRTE) (a.k.a GA mode),
> current driver disables interrupt remapping when it updates the IRTE
> so that the upper and lower 64-bit values can be updated safely.
> 
> However, this creates a small window, where the interrupt could
> arrive and result in IO_PAGE_FAULT (for interrupt) as shown below.
> 
>   IOMMU Driver            Device IRQ
>   ============            ===========
>   irte.RemapEn=0
>        ...
>    change IRTE            IRQ from device ==> IO_PAGE_FAULT !!
>        ...
>   irte.RemapEn=1
> 
> This scenario has been observed when changing irq affinity on a system
> running I/O-intensive workload, in which the destination APIC ID
> in the IRTE is updated.
> 
> Instead, use cmpxchg_double() to update the 128-bit IRTE at once without
> disabling the interrupt remapping. However, this means several features,
> which require GA (128-bit IRTE) support will also be affected if cmpxchg16b
> is not supported (which is unprecedented for AMD processors w/ IOMMU).
> 
Probably requires:

 Fixes: 880ac60e2538 ("iommu/amd: Introduce interrupt remapping ops structure")

?

> Reported-by: Sean Osborne <sean.m.osborne@oracle.com>
> Tested-by: Erik Rockstrom <erik.rockstrom@oracle.com>
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

With the comments below addressed, FWIW:

 Reviewed-by: Joao Martins <joao.m.martins@oracle.com>

> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index c652f16eb702..ad30467f6930 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -1511,7 +1511,14 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h)
>  			iommu->mmio_phys_end = MMIO_REG_END_OFFSET;
>  		else
>  			iommu->mmio_phys_end = MMIO_CNTR_CONF_OFFSET;
> -		if (((h->efr_attr & (0x1 << IOMMU_FEAT_GASUP_SHIFT)) == 0))
> +
> +		/*
> +		 * Note: GA (128-bit IRTE) mode requires cmpxchg16b supports.
> +		 * GAM also requires GA mode. Therefore, we need to
> +		 * check cmbxchg16b support before enabling it.
> +		 */

s/cmbxchg16b/cmpxchg16b

> +		if (!boot_cpu_has(X86_FEATURE_CX16) ||
> +		    ((h->efr_attr & (0x1 << IOMMU_FEAT_GASUP_SHIFT)) == 0))
>  			amd_iommu_guest_ir = AMD_IOMMU_GUEST_IR_LEGACY;
>  		break;
>  	case 0x11:
> @@ -1520,8 +1527,18 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h)
>  			iommu->mmio_phys_end = MMIO_REG_END_OFFSET;
>  		else
>  			iommu->mmio_phys_end = MMIO_CNTR_CONF_OFFSET;
> -		if (((h->efr_reg & (0x1 << IOMMU_EFR_GASUP_SHIFT)) == 0))
> +
> +		/*
> +		 * Note: GA (128-bit IRTE) mode requires cmpxchg16b supports.
> +		 * XT, GAM also requires GA mode. Therefore, we need to
> +		 * check cmbxchg16b support before enabling them.

s/cmbxchg16b/cmpxchg16b

> +		 */
> +		if (boot_cpu_has(X86_FEATURE_CX16) ||

You probably want !boot_cpu_has(X86_FEATURE_CX16) ?

> +		    ((h->efr_reg & (0x1 << IOMMU_EFR_GASUP_SHIFT)) == 0)) {
>  			amd_iommu_guest_ir = AMD_IOMMU_GUEST_IR_LEGACY;
> +			break;
> +		}
> +
>  		/*
>  		 * Note: Since iommu_update_intcapxt() leverages
>  		 * the IOMMU MMIO access to MSI capability block registers
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
