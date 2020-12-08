Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ED62D369B
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 00:01:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D1AF822F7;
	Tue,  8 Dec 2020 23:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeFdD0Ub1x6G; Tue,  8 Dec 2020 23:01:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 23DDD87641;
	Tue,  8 Dec 2020 23:01:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08C50C013B;
	Tue,  8 Dec 2020 23:01:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4EC3C013B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A5CC886DD6
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JxI4t178oWh for <iommu@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 23:01:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 37A3F86DD3
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:01:27 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f08002eb81e5fb58e3a10.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:800:2eb8:1e5f:b58e:3a10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B00FD1EC053C;
 Wed,  9 Dec 2020 00:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1607468484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Blu5v8fcrvQrvAUlkngUq7c7NQ0Ki8U83FN+6m7vV6Q=;
 b=psFxMRLN9mm0OzN8nYo3NvMVZj4Qkmmz/cJxzG7NTYOuskoBcQI4mUW6uFb7S/0aXG0DP/
 9AP+BBTpY5vHFDBa+gcVy8bzLuXvpzFOUlBHAndkS7AZ2wq/bLCR5xG0i79OIm3rKhnG6V
 C8jqGxsmHW+1cXJrtSZ+kn8LFRw7j9s=
Date: Wed, 9 Dec 2020 00:01:19 +0100
From: Borislav Petkov <bp@alien8.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v8] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
Message-ID: <20201208230119.GG27920@zn.tnic>
References: <20201207231057.26403-1-Ashish.Kalra@amd.com>
 <20201208222220.GA27599@char.us.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208222220.GA27599@char.us.oracle.com>
Cc: Thomas.Lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 Jon.Grimm@amd.com, brijesh.singh@amd.com, dave.hansen@linux-intel.com,
 peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, mingo@redhat.com, luto@kernel.org,
 hpa@zytor.com, rientjes@google.com, tglx@linutronix.de, hch@lst.de
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

On Tue, Dec 08, 2020 at 05:22:20PM -0500, Konrad Rzeszutek Wilk wrote:
> I will fix it up.

So who's picking this up? If not me then I probably should have a
detailed look at the x86 bits before it goes in...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
