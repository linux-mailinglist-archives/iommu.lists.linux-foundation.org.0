Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 474023A4C33
	for <lists.iommu@lfdr.de>; Sat, 12 Jun 2021 04:14:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB54A401FA;
	Sat, 12 Jun 2021 02:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2n42mGly9plP; Sat, 12 Jun 2021 02:14:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E98C3401F5;
	Sat, 12 Jun 2021 02:14:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC005C000B;
	Sat, 12 Jun 2021 02:14:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 930B8C000B
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 02:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 801AD40477
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 02:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xa947sSiYN-7 for <iommu@lists.linux-foundation.org>;
 Sat, 12 Jun 2021 02:14:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 583C84041A
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 02:14:49 +0000 (UTC)
IronPort-SDR: 8zo+9X662QZh3ecxGh6J2fHUuk9Qwc+xQUiK6CR+xnH8J8fv73AT6hOo5LWFGgiSuqwg/u5k5b
 9XDJSnX79Amg==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="185332501"
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="185332501"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 19:14:48 -0700
IronPort-SDR: zFoT6/2u2LKVQcB4dM1HXOmKvoCHyY0If2ZNmOSdEuMOQYuur6hisdLmnKeigQAH7F1iSht3LE
 vlMF1SL7U7MA==
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="483472737"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.238.4.20])
 ([10.238.4.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 19:14:45 -0700
Subject: Re: [PATCH v12 3/5] iommu/vt-d: Add support for IOMMU default DMA
 mode build options
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 dwmw2@infradead.org, robin.murphy@arm.com
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-4-git-send-email-john.garry@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f3940a3f-d1c1-148d-e4b5-51cecf924ff5@linux.intel.com>
Date: Sat, 12 Jun 2021 10:14:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623414043-40745-4-git-send-email-john.garry@huawei.com>
Content-Language: en-US
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On 2021/6/11 20:20, John Garry wrote:
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 2a71347611d4..4467353f981b 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -94,6 +94,7 @@ choice
>   	prompt "IOMMU default DMA mode"
>   	depends on IOMMU_DMA
>   
> +	default IOMMU_DEFAULT_LAZY if INTEL_IOMMU
>   	default IOMMU_DEFAULT_STRICT

If two default values are different. Which one will be overridden?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
