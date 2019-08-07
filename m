Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61484AF3
	for <lists.iommu@lfdr.de>; Wed,  7 Aug 2019 13:46:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DE4D9C21;
	Wed,  7 Aug 2019 11:46:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F602BA9
	for <iommu@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 11:46:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BB091823
	for <iommu@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 11:45:59 +0000 (UTC)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alpha.anastas.io (Postfix) with ESMTPSA id 4E68D7F6C7;
	Wed,  7 Aug 2019 06:45:56 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
	t=1565178359; bh=446J/ks+11OkveMVUDF0cNPnmfj1n92jZbU24O7P9/w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=hP9u2rSZ2plqV7LSihnZ4KMQVILfq7Ta2sV8HqIs1xbk2MqAhVpRJ6umqGgci1XIw
	hvh77x7f8n37Psb6kp4uuHgh1P6AfAITszpAvWuCtCDloHJlE5k+uWk9f/dQej3UDU
	qMHsetLafrL3ESTZBFd89wh1+uVXTW3/D3TX+Bpwv2+kSdwrkuePe9f0Clec/3r7iH
	7yIC+pqI+WIPPbX9PsepRnRJZLc921VqOzBwDqsh6FmLCalWwMFybFzndKvL3JEuXi
	5dqTaMkGqM4FXMkjra5WMd5s7geBuqsT9BcRdnx5ncHjHaUtqJtFLGYWb97FotCml5
	CVyfcDxoPGXew==
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
To: Christoph Hellwig <hch@lst.de>
References: <20190805080145.5694-1-hch@lst.de>
	<20190805080145.5694-2-hch@lst.de>
	<7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
	<20190807060432.GD6627@lst.de>
Message-ID: <765a7f25-0e3d-3edc-3f6d-9a17e2379253@anastas.io>
Date: Wed, 7 Aug 2019 13:45:51 +0200
MIME-Version: 1.0
In-Reply-To: <20190807060432.GD6627@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Gavin Li <git@thegavinli.com>, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	iommu@lists.linux-foundation.org, Paul Burton <paul.burton@mips.com>,
	Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On 8/7/19 8:04 AM, Christoph Hellwig wrote:
> Actually it is typical modern Linux style to just provide a prototype
> and then use "if (IS_ENABLED(CONFIG_FOO))" to guard the call(s) to it.

I see.

>> Also, like Will mentioned earlier, the function name isn't entirely
>> accurate anymore. I second the suggestion of using something like
>> arch_dma_noncoherent_pgprot().
> 
> As mentioned I plan to remove arch_dma_mmap_pgprot for 5.4, so I'd
> rather avoid churn for the short period of time.

Yeah, fair enough.

>> As for your idea of defining
>> pgprot_dmacoherent for all architectures as
>>
>> #ifndef pgprot_dmacoherent
>> #define pgprot_dmacoherent pgprot_noncached
>> #endif
>>
>> I think that the name here is kind of misleading too, since this
>> definition will only be used when there is no support for proper
>> DMA coherency.
> 
> Do you have a suggestion for a better name?  I'm pretty bad at naming,
> so just reusing the arm name seemed like a good way to avoid having
> to make naming decisions myself.

Good question. Perhaps something like `pgprot_dmacoherent_fallback`
would better convey that this is only used for devices that don't
support DMA coherency? Or maybe `pgprot_dma_noncoherent`?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
