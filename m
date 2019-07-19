Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1F26E1C9
	for <lists.iommu@lfdr.de>; Fri, 19 Jul 2019 09:37:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 82CBC2271;
	Fri, 19 Jul 2019 07:37:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 701832205
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 07:36:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 17636892
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 07:36:44 +0000 (UTC)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alpha.anastas.io (Postfix) with ESMTPSA id 02BC77F92F;
	Fri, 19 Jul 2019 02:36:43 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
	t=1563521804; bh=DOeY01lxwZti9woJpEBA+lAJ08+UzoDDuA49gXiGLkc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=SEbNU/1/gVAOEAoqOo2wZdU0O7c1WarNt7PQrJo9lyC8bPBP/YEB05TZhkfG9Eg9l
	qg1+1iScjT01Bu0kTYRfe8EwSUqsBh0kacfyB/8bUvIfbWD+UQVF5YwAmQOIGc7oI7
	oKDCJkKBELCl38is+tIVTX6QoyFIYUZNhr0PopyyzBYD+Y2LKGuJ39sSCpTJbAUYs4
	T+JBc9Nzw1YrhrvW+WcrJh7HtUoR+tcPhqTjMvYSfHtcm2+PSPk/0KGOVaK4Gsq39v
	ZVtKc2c5hwfIidblCCzMxjpxrLRViP5/AJfWVEWWw2XyvuT8g0a7LOSDcWZZgueoiN
	D7LZXmqSPUWYQ==
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
To: Christoph Hellwig <hch@lst.de>
References: <20190717235437.12908-1-shawn@anastas.io>
	<8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
	<f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
	<CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
	<20190718084934.GF24562@lst.de> <20190718095200.GA25744@lst.de>
	<2da4fafe-93f2-4bf1-62e1-180a3ac800fa@anastas.io>
	<20190719070659.GA19555@lst.de>
Message-ID: <3dd3bf62-3881-51f1-bbb0-e8ee515bb3d8@anastas.io>
Date: Fri, 19 Jul 2019 02:36:42 -0500
MIME-Version: 1.0
In-Reply-To: <20190719070659.GA19555@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, iommu@lists.linux-foundation.org,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
From: Shawn Anastasio via iommu <iommu@lists.linux-foundation.org>
Reply-To: Shawn Anastasio <shawn@anastas.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 7/19/19 2:06 AM, Christoph Hellwig wrote:
 > What is inherently architecture specific here over the fact that
 > the pgprot_* expand to architecture specific bits?

What I meant is that different architectures seem to have different
criteria for setting the different pgprot_ bits. i.e. ppc checks
for cache coherency, arm64 checks for cache coherency and
writecombine, mips just checks for writecombine, etc.

That being said, I'm no expert here and there is probably some behavior
here that would make for a much more sane default.

 > I'd rather not create boilerplate code where we don't have to it. Note
 > that arch_dma_mmap_pgprot is a little misnamed now, as we also use it
 > for the in-kernel remapping in kernel/dma/remap.c, which I'm slowly
 > switching a lot of architectures to.  powerpc will follow soon once
 > I get the ppc44x that was given to me to actually boot with a recent
 > kernel (not that I've tried much so far).

Fair enough. I didn't realize that most of the other architectures
don't use the common code anyways as you mention below.

 > Every arch except for arm32 now uses dma direct for the direct mapping,
 > and thus the common code without the indeed odd default.  I also have
 > a series to remove the default fallback, which is inherently a bad idea:
 >
 > 
http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-no-defaults

Awesome. This is great to hear.

 > I think your patch that started this thread is fine for 5.3 and -stable:
 >
 > Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks!

 > But going forward I'd rather have a sane default.

Agreed.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
