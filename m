Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B00EB3CA05E
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 16:16:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4760E83DAE;
	Thu, 15 Jul 2021 14:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55423qcmc8Lx; Thu, 15 Jul 2021 14:16:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6B96083DA4;
	Thu, 15 Jul 2021 14:16:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 543BCC001F;
	Thu, 15 Jul 2021 14:16:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D0A3C000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 14:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C69783DAE
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 14:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVZ6anv_rvg4 for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 14:16:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F9683DA4
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 14:16:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D45586D;
 Thu, 15 Jul 2021 07:16:14 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DB603F694;
 Thu, 15 Jul 2021 07:16:14 -0700 (PDT)
Subject: Re: [PATCH v2] iommu: Streamline iommu_iova_to_phys()
To: Christoph Hellwig <hch@infradead.org>
References: <f564f3f6ff731b898ff7a898919bf871c2c7745a.1626354264.git.robin.murphy@arm.com>
 <YPBBJUWvFixPpFYF@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d4eb3346-2152-8a7c-619f-b8d5ee222410@arm.com>
Date: Thu, 15 Jul 2021 15:16:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPBBJUWvFixPpFYF@infradead.org>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
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

On 2021-07-15 15:07, Christoph Hellwig wrote:
> On Thu, Jul 15, 2021 at 02:04:24PM +0100, Robin Murphy wrote:
>> If people are going to insist on calling iommu_iova_to_phys()
>> pointlessly and expecting it to work,
> 
> Maybe we need to fix that?

Feel free to try, but we didn't have much luck pushing back on it 
previously, so playing whack-a-mole against netdev now is a game I'm 
personally happy to stay away from ;)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
