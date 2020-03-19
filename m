Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A518BDF2
	for <lists.iommu@lfdr.de>; Thu, 19 Mar 2020 18:26:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EDD2C87DBA;
	Thu, 19 Mar 2020 17:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YG-rayKHihyg; Thu, 19 Mar 2020 17:26:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 189BB87E81;
	Thu, 19 Mar 2020 17:26:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC80EC07FF;
	Thu, 19 Mar 2020 17:26:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28A20C07FF
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 17:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 203B786D5C
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 17:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qK95V0vF4JYO for <iommu@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 17:26:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DFB0D86D76
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 17:26:11 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jEyvW-0006QR-UH; Thu, 19 Mar 2020 18:25:51 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id E6E1F103088; Thu, 19 Mar 2020 18:25:49 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Borislav Petkov <bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
In-Reply-To: <20200319112054.GD13073@zn.tnic>
References: <20200317111822.GA15609@zn.tnic> <20200319101657.GB13073@zn.tnic>
 <20200319102011.GA3617@lst.de> <20200319102834.GC13073@zn.tnic>
 <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
 <20200319112054.GD13073@zn.tnic>
Date: Thu, 19 Mar 2020 18:25:49 +0100
Message-ID: <878sjw5k9u.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Cc: linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
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

> On Thu, Mar 19, 2020 at 11:06:15AM +0000, Robin Murphy wrote:
>> Let me add another vote from a native English speaker that "unencrypted" is
>> the appropriate term to imply the *absence* of encryption, whereas
>> "decrypted" implies the *reversal* of applied encryption.
>> 
>> Naming things is famously hard, for good reason - names are *important* for
>> understanding. Just because a decision was already made one way doesn't mean
>> that that decision was necessarily right. Churning one area to be
>> consistently inaccurate just because it's less work than churning another
>> area to be consistently accurate isn't really the best excuse.
>
> Well, the reason we chose "decrypted" vs something else is so to be as
> different from "encrypted" as possible. If we called it "unencrypted"
> you'd have stuff like:
>
>        if (force_dma_unencrypted(dev))
>                 set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);

TBH, I don't see how

	if (force_dma_decrypted(dev))
		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
       
makes more sense than the above. It's both non-sensical unless there is
a big fat comment explaining what this is about.

Thanks,

        tglx

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
