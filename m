Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D98D273570
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 00:03:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A29B87201;
	Mon, 21 Sep 2020 22:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRWp7gxBa+7G; Mon, 21 Sep 2020 22:03:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7428B871FF;
	Mon, 21 Sep 2020 22:03:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51E82C0051;
	Mon, 21 Sep 2020 22:03:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16B16C0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 22:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 012B38653D
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 22:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEsbBN6wSOA0 for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 22:03:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id D14078651E
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 22:03:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A75E147A;
 Mon, 21 Sep 2020 15:03:51 -0700 (PDT)
Received: from [10.57.50.108] (unknown [10.57.50.108])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 300193F73B;
 Mon, 21 Sep 2020 15:03:49 -0700 (PDT)
Subject: Re: [PATCHv4 1/6] iommu/io-pgtable-arm: Add support to use system
 cache
To: Will Deacon <will@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <3b1beb6cf6a34a44b0ecff9ec5a2105b5ff91bd4.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <20200921180318.GG3141@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9646dd4f-f1e6-992d-b8a0-0f2c14fa9fe8@arm.com>
Date: Mon, 21 Sep 2020 23:03:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921180318.GG3141@willie-the-truck>
Content-Language: en-GB
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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

On 2020-09-21 19:03, Will Deacon wrote:
> On Fri, Sep 11, 2020 at 07:57:18PM +0530, Sai Prakash Ranjan wrote:
>> Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
>> attributes set in TCR for the page table walker when
>> using system cache.
> 
> I wonder if the panfrost folks can reuse this for the issue discussed
> over at:
> 
> https://lore.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com

Isn't this all hinged around the outer cacheability attribute, rather 
than shareability (since these are nominally NC mappings and thus 
already properly Osh)? The Panfrost issue is just about shareability 
domains being a bit wonky; the cacheability attributes there are 
actually reasonably normal (other than not having a non-cacheable type 
at all, only a choice of allocation policies...)

Robin.

> However, Sai, your email setup went wrong when you posted this so you
> probably need to repost now that you have that fixed.
> 
> Will
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
