Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1529D186
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 19:48:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7F60D2076B;
	Wed, 28 Oct 2020 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXlTt7EhP9Qy; Wed, 28 Oct 2020 18:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 721CB20555;
	Wed, 28 Oct 2020 18:48:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A934C0051;
	Wed, 28 Oct 2020 18:48:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34BD1C0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 18:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 18989874D7
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 18:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nm4XmdR6+ulp for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 18:43:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 47134874D5
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 18:43:49 +0000 (UTC)
IronPort-SDR: YeJakDk549TOYLOU1b2LaNX6ZuPhd6gZ6H21ejt8SyqOGg4hYT+aqJGK6nOaGPv1r5EBrHfW1q
 KJyRboHmb1AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="148173023"
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; d="scan'208";a="148173023"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 11:43:48 -0700
IronPort-SDR: z73T4VYYFT8e/7DDXn39yXFeEnTXnAf5KaKtE9AS9Pb5mkBEEBd5DLuJxvDFbuThfJdpmDbnDG
 C6BaGsiPU8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; d="scan'208";a="424809030"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2020 11:43:48 -0700
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com
 [10.7.201.137])
 by linux.intel.com (Postfix) with ESMTP id 8C97A580713;
 Wed, 28 Oct 2020 11:43:48 -0700 (PDT)
Message-ID: <d414a22fbae9575e6c04f4a557ae49a2cd8eac57.camel@linux.intel.com>
Subject: Re: [Devel] [RFC PATCH 2/4] ACPI/IORT: Add support for RMR node
 parsing
From: "David E. Box" <david.e.box@linux.intel.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
 iommu@lists.linux-foundation.org, devel@acpica.org
Date: Wed, 28 Oct 2020 11:43:48 -0700
In-Reply-To: <20201027112646.44680-3-shameerali.kolothum.thodi@huawei.com>
References: <20201027112646.44680-1-shameerali.kolothum.thodi@huawei.com>
 <20201027112646.44680-3-shameerali.kolothum.thodi@huawei.com>
Organization: David E. Box
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Oct 2020 18:48:12 +0000
Cc: linuxarm@huawei.com, robin.murphy@arm.com, wanghuiqiang@huawei.com
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
Reply-To: david.e.box@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi,

On Tue, 2020-10-27 at 11:26 +0000, Shameer Kolothum wrote:

...

> @@ -1647,6 +1667,100 @@ static void __init iort_enable_acs(struct
> acpi_iort_node *iort_node)
>  #else
>  static inline void iort_enable_acs(struct acpi_iort_node *iort_node)
> { }
>  #endif
> +static int iort_rmr_desc_valid(struct acpi_iort_rmr_desc *desc)
> +{
> +	struct iort_rmr_entry *e;
> +	u64 end, start = desc->base_address, length = desc->length;
> +
> +	if ((!IS_ALIGNED(start, SZ_64K)) || (length % SZ_64K != 0))

You could just do:

if ((!IS_ALIGNED(start, SZ_64K)) || (length % SZ_64K))

David

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
