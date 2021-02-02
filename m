Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98E30C4C2
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 17:02:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 675A78569B;
	Tue,  2 Feb 2021 16:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIxbwR6esjML; Tue,  2 Feb 2021 16:02:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 94E34867A1;
	Tue,  2 Feb 2021 16:02:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EFE4C013A;
	Tue,  2 Feb 2021 16:02:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ACB2C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 16:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5306D85B5B
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 16:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXu4wa1OWfsx for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 16:02:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6EC6A85BD3
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 16:02:39 +0000 (UTC)
IronPort-SDR: 3k4wUQcdJZzvOFGovmdTXj7BZ5x6BEMjBKYM/NS8i0Ks/30MQ2VPbOvwIj+zd7fnTFI2IkkLHf
 xitRal9h39Qw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="167982805"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="167982805"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 08:02:05 -0800
IronPort-SDR: WcdYkPRXUqohBorHCWPa39uqCYS2UNGPfQBCshTFXwH9yhdYaBrdh0uXR/pGgbkychYHIhgkmo
 v3VNEOM9HDWA==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="391535200"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 08:02:05 -0800
Date: Tue, 2 Feb 2021 08:02:03 -0800
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/3] iommu/vt-d: Add new enum value and structure for SATC
Message-ID: <20210202160203.GC39643@otc-nc-03>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210202044057.615277-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202044057.615277-2-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Ashok Raj <ashok.raj@intel.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On Tue, Feb 02, 2021 at 12:40:55PM +0800, Lu Baolu wrote:
> From: Yian Chen <yian.chen@intel.com>
> 
> Starting from Intel Platform VT-d v3.2, BIOS may provide new remapping
> structure SATC for SOC integrated devices, according to section 8.8 of
> Intel VT-d architecture specification v3.2. The SATC structure reports
> a list of the devices that require SATC enabling via ATS capacity.

nit: s/require SATC/require ATS for normal device operation. This is a
functional requirement that these devices will not work without OS enabling
ATS capability.

> 
> This patch introduces the new enum value and structure to represent the
> remapping information. Kernel should parse the information from the
> reporting structure and enable ATC for the devices as needed.
> 
> Signed-off-by: Yian Chen <yian.chen@intel.com>
> ---
>  include/acpi/actbl1.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
> index 43549547ed3e..b7ca802b66d2 100644
> --- a/include/acpi/actbl1.h
> +++ b/include/acpi/actbl1.h
> @@ -514,7 +514,8 @@ enum acpi_dmar_type {
>  	ACPI_DMAR_TYPE_ROOT_ATS = 2,
>  	ACPI_DMAR_TYPE_HARDWARE_AFFINITY = 3,
>  	ACPI_DMAR_TYPE_NAMESPACE = 4,
> -	ACPI_DMAR_TYPE_RESERVED = 5	/* 5 and greater are reserved */
> +	ACPI_DMAR_TYPE_SATC = 5,
> +	ACPI_DMAR_TYPE_RESERVED = 6	/* 5 and greater are reserved */
>  };
>  

Think Joerg spotted the comment update.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
