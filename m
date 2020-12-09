Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDA22D4279
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 13:54:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D60487031;
	Wed,  9 Dec 2020 12:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fqspu0iwN+0b; Wed,  9 Dec 2020 12:54:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2FDB87038;
	Wed,  9 Dec 2020 12:54:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8F5AC013B;
	Wed,  9 Dec 2020 12:54:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1413BC013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 01C3A87822
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gg8d8bgnP2CG for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 12:54:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 659F287815
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:54:49 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f48006cdc67c2e76428ce.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:4800:6cdc:67c2:e764:28ce])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A98A11EC04C1;
 Wed,  9 Dec 2020 13:54:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1607518486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=s58KPrB1ihI+LMGijJBh7kVxdsHPRujydS8Yr1KZJyY=;
 b=Htb9TGJEGhuSw/R+TpMSxdmZPvhSikcKi8AIQj8RbWm9l88XAx2w/W8ZJ2i5sAjtj8KEYG
 wXw9R1XLmsnpXZzsInt10YECgG1qVJdI5e5fsSXQhFcuthXHC3BhwPY3tU4jZfZx8raG4t
 hcvWBa4iGyjqon+QKyP6FeMSAcyqAIo=
Date: Wed, 9 Dec 2020 13:54:42 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ashish Kalra <ashish.kalra@amd.com>
Subject: Re: [PATCH v8] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
Message-ID: <20201209125442.GC18203@zn.tnic>
References: <20201207231057.26403-1-Ashish.Kalra@amd.com>
 <20201209110115.GA18203@zn.tnic>
 <20201209122907.GA6258@ashkalra_ubuntu_server>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209122907.GA6258@ashkalra_ubuntu_server>
Cc: Thomas.Lendacky@amd.com, Jon.Grimm@amd.com, brijesh.singh@amd.com,
 dave.hansen@linux-intel.com, konrad.wilk@oracle.com, peterz@infradead.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 mingo@redhat.com, luto@kernel.org, hpa@zytor.com, rientjes@google.com,
 tglx@linutronix.de, hch@lst.de
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

On Wed, Dec 09, 2020 at 12:29:07PM +0000, Ashish Kalra wrote:
> As i mentioned in the main comments above, this cannot be called in
> mem_encrypt_init() as that breaks reserve_crashkernel() which depends
> on SWIOTLB buffer size

Please elaborate how does it break.

> and is called before mem_encrypt_init(), therefore, it needs to be
> called from setup_atch() before reserve_crashkernel().

I know you have your requirements what needs to be called when like all
the other vendors who want to run stuff early in a particular order but
our boot init order is a single fragile mess. So this better be done
right!

Also,

[    0.016630] software IO TLB: swiotlb_adjust:
[    0.017005] reserve_crashkernel:
[    0.050523] software IO TLB: swiotlb_init:

this looks strange - we're doing a swiotlb size adjust before init.

It probably makes sense as in: adjust the size before the SWIOTLB is
initialized so that it uses the correct size but this better be spelled
out.

> I believe that other memory encryption architectures such as s390 are
> also looking for something similar to be available.

Until you have something more palpable than belief, "let the others
extend it when they really need it." as I already mentioned.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
