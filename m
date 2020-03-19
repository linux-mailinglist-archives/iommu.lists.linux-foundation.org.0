Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7818B240
	for <lists.iommu@lfdr.de>; Thu, 19 Mar 2020 12:20:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 222152268C;
	Thu, 19 Mar 2020 11:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjTg41Cqm-u2; Thu, 19 Mar 2020 11:20:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1321E22122;
	Thu, 19 Mar 2020 11:20:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF7E0C07FF;
	Thu, 19 Mar 2020 11:20:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56283C07FF
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 11:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 44132220C5
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 11:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SY-UgxD6Ojoa for <iommu@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 11:20:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by silver.osuosl.org (Postfix) with ESMTPS id 893AE20656
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 11:20:51 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0A850065FC6DE3D46B17C3.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:8500:65fc:6de3:d46b:17c3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DCF9F1EC085F;
 Thu, 19 Mar 2020 12:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1584616849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=IlMyw2jWgHGOB/uFSKCAtl/3A39ugp/rgom8OdfSKmc=;
 b=XE6cHInWOykMJewXB+HpQ43S3ZQrlzEAhf//Ouf5Qimx2SKQA9/gvUhLWvplfK6878RP+v
 ZqLYTWIZthoqXO6tVrkIxYVE1pcVuGHGY61Fde74hzfcGiK9dOuneS2M+Jk5sfOhuyCzWq
 w4QHxgKVH2Zv2Ff20bGX9PTvSDxGf0s=
Date: Thu, 19 Mar 2020 12:20:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
Message-ID: <20200319112054.GD13073@zn.tnic>
References: <20200317111822.GA15609@zn.tnic> <20200319101657.GB13073@zn.tnic>
 <20200319102011.GA3617@lst.de> <20200319102834.GC13073@zn.tnic>
 <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
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

On Thu, Mar 19, 2020 at 11:06:15AM +0000, Robin Murphy wrote:
> Let me add another vote from a native English speaker that "unencrypted" is
> the appropriate term to imply the *absence* of encryption, whereas
> "decrypted" implies the *reversal* of applied encryption.
> 
> Naming things is famously hard, for good reason - names are *important* for
> understanding. Just because a decision was already made one way doesn't mean
> that that decision was necessarily right. Churning one area to be
> consistently inaccurate just because it's less work than churning another
> area to be consistently accurate isn't really the best excuse.

Well, the reason we chose "decrypted" vs something else is so to be as
different from "encrypted" as possible. If we called it "unencrypted"
you'd have stuff like:

       if (force_dma_unencrypted(dev))
                set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);

and I *betcha* people will misread this and maybe even introduce bugs.

So I don't think renaming it to "unencrypted" is better. And yes, I'm
deliberately putting the language semantics here on a second place
because of readability examples like the one above.

But ok, since people don't want this, we can leave it as is. It's not
like I don't have anything better to do.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
