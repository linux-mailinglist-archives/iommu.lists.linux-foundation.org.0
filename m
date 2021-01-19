Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAAE2FBBA2
	for <lists.iommu@lfdr.de>; Tue, 19 Jan 2021 16:52:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8B39F2078D;
	Tue, 19 Jan 2021 15:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o9EAI3PNtKj5; Tue, 19 Jan 2021 15:52:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3A34520796;
	Tue, 19 Jan 2021 15:52:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EDB6C013A;
	Tue, 19 Jan 2021 15:52:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62470C013A
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4F3A62078D
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5vOgLxDOGgsy for <iommu@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 15:52:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 3E2BB2078B
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:52:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79CDDD6E;
 Tue, 19 Jan 2021 07:52:43 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CA143F66E;
 Tue, 19 Jan 2021 07:52:42 -0800 (PST)
Subject: Re: [PATCH 1/2 v2] dma-iommu: use static-key to minimize the impact
 in the fast-path
To: Christoph Hellwig <hch@infradead.org>, Lianbo Jiang <lijiang@redhat.com>
References: <20210119111616.12761-1-lijiang@redhat.com>
 <20210119111616.12761-2-lijiang@redhat.com>
 <20210119152641.GA3453587@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c961822e-e768-9d20-87cf-85db95b6aab6@arm.com>
Date: Tue, 19 Jan 2021 15:52:41 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119152641.GA3453587@infradead.org>
Content-Language: en-GB
Cc: thomas.lendacky@amd.com, iommu@lists.linux-foundation.org, will@kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-01-19 15:26, Christoph Hellwig wrote:
> On Tue, Jan 19, 2021 at 07:16:15PM +0800, Lianbo Jiang wrote:
>> +static DEFINE_STATIC_KEY_FALSE(__deferred_attach);
> 
> Why the strange underscores?  Wouldn't iommu_deferred_attach_enabled
> be a better name?
> 
>> -	if (unlikely(iommu_dma_deferred_attach(dev, domain)))
>> +	if (static_branch_unlikely(&__deferred_attach) &&
>> +	    iommu_dma_deferred_attach(dev, domain))
> 
> Also insted of duplicating this logic in three places, maybe rename
> iommu_dma_deferred_attach to __iommu_dma_deferred_attach and create
> a small inline wrapper for it?

Once patch #2 is in place, I really don't see any point. The "helper" 
would add a minimum of 5 lines to save at most 3, and would have to be 
annotated as always_inline - which a whole other camp of people would 
probably object to - in order for the static branch to be properly useful.

It's not as if this is a complex or hard-to-read expression, so IMO 
having 3 lines repeated 3 times is objectively better than having 2 
lines necessarily repeated 3 times plus having to scroll up and find 
several more lines to follow what it's doing.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
