Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 627EF39BEE8
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 19:35:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D11D8439B;
	Fri,  4 Jun 2021 17:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ci2i1H6hkIW; Fri,  4 Jun 2021 17:35:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1397984398;
	Fri,  4 Jun 2021 17:35:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7D3CC0001;
	Fri,  4 Jun 2021 17:35:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F504C000D
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 17:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9F1A843DA
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 17:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlmJYC1lIQXD for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 17:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id C32C084399
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 17:35:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BFC21063;
 Fri,  4 Jun 2021 10:35:24 -0700 (PDT)
Received: from [10.57.6.115] (unknown [10.57.6.115])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74ADE3F73D;
 Fri,  4 Jun 2021 10:35:23 -0700 (PDT)
Subject: Re: [PATCH] iommu/amd: Tidy up DMA ops init
To: Joerg Roedel <joro@8bytes.org>
References: <665db61e23ff8d54ac5eb391bef520b3a803fcb9.1622727974.git.robin.murphy@arm.com>
 <YLpGHx+rYnBF64Yh@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <781da5b3-4856-9a76-d803-51800dec6033@arm.com>
Date: Fri, 4 Jun 2021 18:35:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLpGHx+rYnBF64Yh@8bytes.org>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Jussi Maki <joamaki@gmail.com>
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

On 2021-06-04 16:26, Joerg Roedel wrote:
> On Thu, Jun 03, 2021 at 02:48:21PM +0100, Robin Murphy wrote:
>> As discussed on the report thread, I think it makes most sense to merge
>> this as a fix for 5.13 and not worry about any backporting.
>>
>>   drivers/iommu/amd/amd_iommu.h |  2 --
>>   drivers/iommu/amd/init.c      |  5 -----
>>   drivers/iommu/amd/iommu.c     | 31 +++++++++++++------------------
>>   3 files changed, 13 insertions(+), 25 deletions(-)
> 
> Applied for v5.13, thanks Robin et al for the quick work on this
> regression.
> 
> Robin, do you by chance have a Fixes tag which I can add?

For the sake of justifying this as "fix" rather than "cleanup", you may 
as well use the flush queue commit cited in the patch log - I maintain 
there's nothing technically wrong with that commit itself, but it is the 
point at which the underlying issue becomes worth fixing due to how they 
interact ;)

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
