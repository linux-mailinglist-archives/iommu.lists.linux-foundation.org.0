Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 602323A0DDF
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 09:39:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 727B0401AF;
	Wed,  9 Jun 2021 07:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BI4x-K95W-ng; Wed,  9 Jun 2021 07:39:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A208C40167;
	Wed,  9 Jun 2021 07:39:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62B5FC000B;
	Wed,  9 Jun 2021 07:39:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0DC2C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EA0560672
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpO5g8T3Aimb for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:38:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91A7060071
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:38:59 +0000 (UTC)
IronPort-SDR: aiDYLoSAjNlEXNNjUumDWKJoSPs+mN4aZwCvW8oFNPiNlA7y4veFxg5BM76+xZn6TeSzutA9ZS
 E/FVfxCh0jEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="266176527"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="266176527"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:38:58 -0700
IronPort-SDR: aymcSzkjsK4Lz0m+QUTmT6eeeCYEHc3zyaPEi7uTXFauEozHlNq4DdtHuYu8BdtzN1usKgamJn
 CU2VCD9sUJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="552588612"
Received: from allen-box.sh.intel.com (HELO [10.239.159.105])
 ([10.239.159.105])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2021 00:38:55 -0700
Subject: Re: [PATCH] iommu: remove redundant assignment to variable agaw
To: Colin King <colin.king@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
References: <20210416171826.64091-1-colin.king@canonical.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b83cb027-2944-2477-c0d2-78f57cf6c6cf@linux.intel.com>
Date: Wed, 9 Jun 2021 15:37:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416171826.64091-1-colin.king@canonical.com>
Content-Language: en-US
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 4/17/21 1:18 AM, Colin King wrote:
> From: Colin Ian King<colin.king@canonical.com>
> 
> The variable agaw is initialized with a value that is never
> read and it is being updated later with a new value as a
> counter in a for-loop. The initialization is redundant and
> can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King<colin.king@canonical.com>

Queued for v5.14. Thanks!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
