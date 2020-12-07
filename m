Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05E2D1D5B
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 23:33:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E7DE42E200;
	Mon,  7 Dec 2020 22:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yJ5sOQdLL9i; Mon,  7 Dec 2020 22:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5F31D2E23D;
	Mon,  7 Dec 2020 22:33:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44290C013B;
	Mon,  7 Dec 2020 22:33:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6790AC013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 22:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 59EEB8795C
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 22:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzVGtFmPDzM1 for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 22:33:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 72FE987916
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 22:33:08 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0a3800f6520bb83eb81f06.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:3800:f652:bb8:3eb8:1f06])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E73401EC0391;
 Mon,  7 Dec 2020 23:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1607380387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=QS7Xejh7Vaqx8FcuZLbicDhbx/3kJCtRN7fq17mk+3Y=;
 b=F0JH38xYZz9/1hpB7ZM603llmBV53eBbd1xiJXWFPSAXoD5nS1n2M4bMnCPOVndnbDG820
 I4TecqnmX2S1GXKXg6X+N96GYugcJNcl25qjrol9d7KeTd1/7CEJxKOfQyQ/FbP0M6wzLE
 bO9TiG8CduVlGlf1z43noJfpucCm4sc=
Date: Mon, 7 Dec 2020 23:33:07 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Kalra, Ashish" <Ashish.Kalra@amd.com>
Subject: Re: [PATCH v7] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
Message-ID: <20201207223307.GK20489@zn.tnic>
References: <20201203032559.3388-1-Ashish.Kalra@amd.com>
 <20201207121007.GD20489@zn.tnic>
 <20201207220624.GB6855@ashkalra_ubuntu_server>
 <20201207221433.GI20489@zn.tnic>
 <60FF61F4-9A7D-4467-A148-2956903C74AA@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60FF61F4-9A7D-4467-A148-2956903C74AA@amd.com>
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "Grimm,
 Jon" <Jon.Grimm@amd.com>, "Singh, Brijesh" <brijesh.singh@amd.com>,
 "dave.hansen@linux-intel.com" <dave.hansen@linux-intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "luto@kernel.org" <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "rientjes@google.com" <rientjes@google.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "hch@lst.de" <hch@lst.de>
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

On Mon, Dec 07, 2020 at 10:20:20PM +0000, Kalra, Ashish wrote:
> It is more of an approximation of the earlier static adjustment which
> was 128M for <1G guests, 256M for 1G-4G guests and 512M for >4G
> guests.

Makes sense and it is better than nothing. Please put that explanation
over the 6% define.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
