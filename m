Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4703D5A0F
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 15:09:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3FCE60678;
	Mon, 26 Jul 2021 13:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uhs26nnRbWRu; Mon, 26 Jul 2021 13:09:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 11A3360590;
	Mon, 26 Jul 2021 13:09:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0D5DC001F;
	Mon, 26 Jul 2021 13:09:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E678BC000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 13:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C792D401E3
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 13:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60JZLVeXR7Hl for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 13:09:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC421401C5
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 13:09:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9D9811B3;
 Mon, 26 Jul 2021 06:09:07 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C2E3F70D;
 Mon, 26 Jul 2021 06:09:06 -0700 (PDT)
Subject: Re: [PATCH 16/23] iommu/arm-smmu: Prepare for multiple DMA domain
 types
To: Joerg Roedel <joro@8bytes.org>
References: <cover.1626888444.git.robin.murphy@arm.com>
 <04220b3420c2c513490450f37de109182364f235.1626888445.git.robin.murphy@arm.com>
 <YP6ukfewNVjgS/bt@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a0689d30-2214-c92e-8387-8f1d3b22909b@arm.com>
Date: Mon, 26 Jul 2021 14:09:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YP6ukfewNVjgS/bt@8bytes.org>
Content-Language: en-GB
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On 2021-07-26 13:46, Joerg Roedel wrote:
> On Wed, Jul 21, 2021 at 07:20:27PM +0100, Robin Murphy wrote:
>> -	if (type == IOMMU_DOMAIN_DMA && using_legacy_binding)
>> +	if ((type & __IOMMU_DOMAIN_DMA_API) && using_legacy_binding)
> 
> Hmm, I wonder whether it is time to introduce helpers for these checks?
> 
> Something like iommu_domain_is_dma() is more readable.

Ha, I had exactly that at one point, except I think in the order of 
iommu_is_dma_domain() :)

The end result didn't seem to give enough extra clarity to justify the 
header churn for me, but I'm happy to be wrong about that if you prefer.

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
