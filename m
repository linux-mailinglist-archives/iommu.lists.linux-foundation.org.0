Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B93275A7
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 01:53:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E071F83C99;
	Mon,  1 Mar 2021 00:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JxHQ_gzZH5NQ; Mon,  1 Mar 2021 00:53:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E286E83B45;
	Mon,  1 Mar 2021 00:53:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C531EC0012;
	Mon,  1 Mar 2021 00:53:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59A3BC0001
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 00:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47EF643014
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 00:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQTnKH-VpllW for <iommu@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 00:53:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF2A642FAC
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 00:53:35 +0000 (UTC)
IronPort-SDR: +/ax2Eea8LW96rKDWVPuknRIyxynmki1hVx6G4MnGhqLK1kG3vumBrHznMFvFXT6EmnhxAZwZp
 nVMg5+To2n6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="205918296"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="205918296"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 16:53:34 -0800
IronPort-SDR: aLtvsQrI8QH9YaUUUS8Mqo5aWURR0Uy3wyoquBZY82C2dk5qiZwjjBI8llH7I1nfYXpcIl/0pT
 xNtPnoa4SDcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="426753275"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2021 16:53:32 -0800
Subject: Re: [PATCH] iommu/vt-d: Fix status code for Allocate/Free PASID
 command
To: Zenghui Yu <yuzenghui@huawei.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20210227073909.432-1-yuzenghui@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <30c18a6d-fd0f-6e63-c231-d6f068410342@linux.intel.com>
Date: Mon, 1 Mar 2021 08:44:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210227073909.432-1-yuzenghui@huawei.com>
Content-Language: en-US
Cc: kevin.tian@intel.com, dwmw2@infradead.org, wanghaibin.wang@huawei.com,
 will@kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2/27/21 3:39 PM, Zenghui Yu wrote:
> As per Intel vt-d spec, Rev 3.0 (section 10.4.45 "Virtual Command Response
> Register"), the status code of "No PASID available" error in response to
> the Allocate PASID command is 2, not 1. The same for "Invalid PASID" error
> in response to the Free PASID command.
> 
> We will otherwise see confusing kernel log under the command failure from
> guest side. Fix it.
> 
> Fixes: 24f27d32ab6b ("iommu/vt-d: Enlightened PASID allocation")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>   drivers/iommu/intel/pasid.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel/pasid.h b/drivers/iommu/intel/pasid.h
> index 97dfcffbf495..444c0bec221a 100644
> --- a/drivers/iommu/intel/pasid.h
> +++ b/drivers/iommu/intel/pasid.h
> @@ -30,8 +30,8 @@
>   #define VCMD_VRSP_IP			0x1
>   #define VCMD_VRSP_SC(e)			(((e) >> 1) & 0x3)
>   #define VCMD_VRSP_SC_SUCCESS		0
> -#define VCMD_VRSP_SC_NO_PASID_AVAIL	1
> -#define VCMD_VRSP_SC_INVALID_PASID	1
> +#define VCMD_VRSP_SC_NO_PASID_AVAIL	2
> +#define VCMD_VRSP_SC_INVALID_PASID	2
>   #define VCMD_VRSP_RESULT_PASID(e)	(((e) >> 8) & 0xfffff)
>   #define VCMD_CMD_OPERAND(e)		((e) << 8)
>   /*
> 

Thanks a lot for catching this.

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
