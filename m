Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3EB880C
	for <lists.iommu@lfdr.de>; Fri, 20 Sep 2019 01:25:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A559D30;
	Thu, 19 Sep 2019 23:24:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 87CECCA8
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 23:24:55 +0000 (UTC)
X-Greylist: delayed 00:07:13 by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1302F108
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 23:24:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 46ZCS303qyz9s7T;
	Fri, 20 Sep 2019 09:17:38 +1000 (AEST)
Date: Fri, 20 Sep 2019 09:17:30 +1000
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wjXF63BKNJH=GtnnoJmXZHEnRwjgeu4foJQvFYYBm9HHA@mail.gmail.com>
References: <20190918152748.GA21241@infradead.org>
	<CAHk-=wjXF63BKNJH=GtnnoJmXZHEnRwjgeu4foJQvFYYBm9HHA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [GIT PULL] dma-mapping updates for 5.4
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>
From: Michael Ellerman <michael@ellerman.id.au>
Message-ID: <D422FEED-06F6-44BE-955F-90318693FD96@ellerman.id.au>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu <iommu@lists.linux-foundation.org>,
	linux-mmc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



On 20 September 2019 6:33:50 am AEST, Linus Torvalds <torvalds@linux-foundation.org> wrote:
>On Wed, Sep 18, 2019 at 8:27 AM Christoph Hellwig <hch@infradead.org>
>wrote:
>>
>> please pull the dma-mapping updates for 5.4.
>
>Pulled.
>
>> In addition to the usual Kconfig conflics where you just want to keep
>> both edits there are a few more interesting merge issues this time:
>>
>>  - most importanly powerpc and microblaze add new callers of
>>    dma_atomic_pool_init, while this tree marks the function static
>>    and calls it from a common postcore_initcall().  The trivial
>>    functions added in powerpc and microblaze adding the calls
>>    need to be removed for the code to compile.  This will not show up
>>    as a merge conflict and needs to be dealt with manually!
>
>So I haven't gotten the powerpc or microblaze pull requests yet, so
>I'm not able to fix that part up yet.
>
>Intead, I'm cc'ing Michael Ellerman and Michal Simek to ask them to
>remind me when they _do_ send those pull requests, since otherwise I
>may well forget and miss it. Without an actual data conflict, and
>since this won't show up in my build tests either, it would be very
>easy for me to forget.
>
>Micha[e]l, can you both please make sure to remind me?

Yeah I was aware of it, and will make sure to remind you in my pull request.

cheers

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
