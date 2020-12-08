Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6702D36EE
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 00:33:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E951620385;
	Tue,  8 Dec 2020 23:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Um+BSN2ojKS2; Tue,  8 Dec 2020 23:33:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B92492048C;
	Tue,  8 Dec 2020 23:33:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91D84C013B;
	Tue,  8 Dec 2020 23:33:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F8C5C013B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DE82386DE5
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBqtjLtnjrHL for <iommu@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 23:33:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2C31B86D7C
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 23:33:23 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f08002eb81e5fb58e3a10.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:800:2eb8:1e5f:b58e:3a10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 95A421EC0541;
 Wed,  9 Dec 2020 00:33:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1607470401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=5ZNUMfRTS3iWTt1V1kV+gFvars2JRmFiQ9QSJSav1tk=;
 b=odEY2ikG3P7AiODunofgZ+MPbpDEQasOPwsTp3EQ13PrPWiwAV8ZV+m4AvDcFHEZxi/KSq
 pNrxKT8N5RwO8MJlQQHOuTSqywg38Qnu463dtTIvBnSAFMcchVvdKm4SRrTI4OHqtQQOj1
 PeR2/TdBF4hVq+wPIz7QzkTFU2ObPMg=
Date: Wed, 9 Dec 2020 00:33:22 +0100
From: Borislav Petkov <bp@alien8.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v8] swiotlb: Adjust SWIOTBL bounce buffer size for SEV
 guests.
Message-ID: <20201208233322.GI27920@zn.tnic>
References: <20201207231057.26403-1-Ashish.Kalra@amd.com>
 <20201208222220.GA27599@char.us.oracle.com>
 <20201208230119.GG27920@zn.tnic>
 <6443B6DC-2C54-48E4-8207-3F2D88B82AC0@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6443B6DC-2C54-48E4-8207-3F2D88B82AC0@oracle.com>
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

On Tue, Dec 08, 2020 at 06:27:39PM -0500, Konrad Rzeszutek Wilk wrote:
> That said if you have the time to take a peek at the x86 bits - that
> would be awesome!

Sure, tomorrow.

Good night. :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
