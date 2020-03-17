Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB0189058
	for <lists.iommu@lfdr.de>; Tue, 17 Mar 2020 22:31:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43143877CE;
	Tue, 17 Mar 2020 21:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kiQ5TVxf+fX2; Tue, 17 Mar 2020 21:31:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB225877C9;
	Tue, 17 Mar 2020 21:31:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6844C013E;
	Tue, 17 Mar 2020 21:31:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60312C013E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Mar 2020 21:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5B4808890A
 for <iommu@lists.linux-foundation.org>; Tue, 17 Mar 2020 21:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IPCie-446r3 for <iommu@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 21:31:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E76E288907
 for <iommu@lists.linux-foundation.org>; Tue, 17 Mar 2020 21:31:09 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0C960029779DE4AAC583E4.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:9600:2977:9de4:aac5:83e4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 58AE31EC0C68;
 Tue, 17 Mar 2020 22:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1584480668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=RMKAealFBjjSPHlKH7zxedK6Vy5tkttV34MQFS3HmiQ=;
 b=LjpQr+GlX3iH9rEkBWb84N4Q1ycXhEIq9TvynjyGe4TTrcJjq+Fn4WVqy1q6xvjSVFjVR5
 QLXkqznZ/G8JHEBkbIojedr2YcdSwmzZdn/FjtptrhJZyyAdnmnnK/8ZMln+7fi4kGNysY
 VZaz4YQQKq3EP6FINuFyeolQaLrbBug=
Date: Tue, 17 Mar 2020 22:31:14 +0100
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH] treewide: Rename "unencrypted" to "decrypted"
Message-ID: <20200317213100.GH15609@zn.tnic>
References: <20200317111822.GA15609@zn.tnic>
 <2cb4a8ae-3b13-67bd-c021-aee47fdf58c5@intel.com>
 <20200317210602.GG15609@zn.tnic>
 <f3e520c6-f455-9c82-abfc-d014ca63eeb5@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3e520c6-f455-9c82-abfc-d014ca63eeb5@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Schofield, Alison" <alison.schofield@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "Shutemov, Kirill" <kirill.shutemov@intel.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Robin Murphy <robin.murphy@arm.com>, lkml <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
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

On Tue, Mar 17, 2020 at 02:24:59PM -0700, Dave Hansen wrote:
> No, there are just two states.  I just think the "!encrypted" case
> should not be called "decrypted".

Yeah, we suck at naming - news at 11! :-)

I believe we even considered things like "encrypted" vs "clear" but
that sucked too. ;-\

In any case, that ship has sailed now and having two as differently as
possible looking words to denote the two "states" should be good enough
for our purposes...

Oh well.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
