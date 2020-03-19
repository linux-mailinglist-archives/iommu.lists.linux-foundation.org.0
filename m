Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 596EE18C3F6
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 00:54:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D376A882A7;
	Thu, 19 Mar 2020 23:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrB92asr7tUl; Thu, 19 Mar 2020 23:54:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2159E882AB;
	Thu, 19 Mar 2020 23:54:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 010BBC1D89;
	Thu, 19 Mar 2020 23:54:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAFF9C07FF
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 23:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 92A09204FC
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 23:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R+jSxa1KXlSK for <iommu@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 23:54:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id CF2E820356
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 23:54:22 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jF4z5-0002E7-Dg; Fri, 20 Mar 2020 00:53:56 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 4DD6B100375; Fri, 20 Mar 2020 00:53:49 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
In-Reply-To: <20200319174254.GE13073@zn.tnic>
References: <20200317111822.GA15609@zn.tnic> <20200319101657.GB13073@zn.tnic>
 <20200319102011.GA3617@lst.de> <20200319102834.GC13073@zn.tnic>
 <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
 <20200319112054.GD13073@zn.tnic> <878sjw5k9u.fsf@nanos.tec.linutronix.de>
 <20200319174254.GE13073@zn.tnic>
Date: Fri, 20 Mar 2020 00:53:49 +0100
Message-ID: <87pnd752b6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Cc: linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Borislav Petkov <bp@alien8.de> writes:
> On Thu, Mar 19, 2020 at 06:25:49PM +0100, Thomas Gleixner wrote:
>> TBH, I don't see how
>> 
>> 	if (force_dma_decrypted(dev))
>> 		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
>>
>> makes more sense than the above. It's both non-sensical unless there is
>
> 9087c37584fb ("dma-direct: Force unencrypted DMA under SME for certain DMA masks")

Reading the changelog again...

I have to say that force_dma_unencrypted() makes way more sense in that
context than force_dma_decrypted(). It still wants a comment.

Linguistical semantics and correctness matters a lot. Consistency is
required as well, but not for the price of ambiguous wording.

Thanks,

        tglx


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
