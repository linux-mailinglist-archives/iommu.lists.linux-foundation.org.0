Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 27129159E16
	for <lists.iommu@lfdr.de>; Wed, 12 Feb 2020 01:39:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B98612034B;
	Wed, 12 Feb 2020 00:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4IzNFRPFITV; Wed, 12 Feb 2020 00:39:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E85B0203A5;
	Wed, 12 Feb 2020 00:39:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCA3CC07FE;
	Wed, 12 Feb 2020 00:39:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91ED5C07FE
 for <iommu@lists.linux-foundation.org>; Wed, 12 Feb 2020 00:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7B36785D57
 for <iommu@lists.linux-foundation.org>; Wed, 12 Feb 2020 00:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mk5LKXYmX6oc for <iommu@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 00:39:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0196385BA9
 for <iommu@lists.linux-foundation.org>; Wed, 12 Feb 2020 00:39:50 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id q84so365701oic.4
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 16:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=noQt5nFC8uX1+KZFclIWhAR/XrOfOL5Ao8eiHvlk32o=;
 b=KpZaJ5eiiiF3NNDWMtpl/g3GG4kaV4BsGUmCjSaY0EzE7E1Rh3cWcZPbF+16RrTcfP
 hZJxcDyWWsjaAYDDsnT+CqpmrbpCHrlbiTRXTZa0DO5Vywc7yvesVnZVFTGr4M2BQM5M
 crKo9InyImp/uMpWNBc0srt5H0D1hR7dXbPO85GCaNXfCErGIGR2w9UCh5PYfgZ+ocAR
 JJgAPSnw3CCQpQj8199ogbWelrnUcaYyX16N5E9BOzUGDizzK+5XBckLZsDlSwR8hx37
 emt0juZVs8+Q9v4qmJEBto+zSW8AA6fBbeBlj4Jc4b5dWDrmeBkYgf3o+aavVQeOgFWg
 2TJQ==
X-Gm-Message-State: APjAAAX9ePYJUnFfjy1FsLpsBEf+BRR0nmjhyPbJVrhBKL3GLsK6XPuf
 a4Gb47ELD8h+afNogJwuEC1guz6K
X-Google-Smtp-Source: APXvYqxFCI6NhM0Ct+8TslycSAGdQKPYF97w1B7cprdavX9SwM0Mx/zMvitTinpih2BZySyPmZ2Eeg==
X-Received: by 2002:aca:dc8b:: with SMTP id t133mr4671465oig.98.1581467989917; 
 Tue, 11 Feb 2020 16:39:49 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
 [209.85.210.41])
 by smtp.gmail.com with ESMTPSA id z10sm1636026oih.1.2020.02.11.16.39.48
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 16:39:48 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id r16so228566otd.2
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 16:39:48 -0800 (PST)
X-Received: by 2002:a9d:7f83:: with SMTP id t3mr3624739otp.63.1581467988518;
 Tue, 11 Feb 2020 16:39:48 -0800 (PST)
MIME-Version: 1.0
References: <1581464215-24777-1-git-send-email-leoyang.li@nxp.com>
 <20200211234536.GK25745@shell.armlinux.org.uk>
In-Reply-To: <20200211234536.GK25745@shell.armlinux.org.uk>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 11 Feb 2020 18:39:37 -0600
X-Gmail-Original-Message-ID: <CADRPPNSOYOe3vuUFEp3z-1RX6QHmRFJpxHTCLhniX-0hh2T01Q@mail.gmail.com>
Message-ID: <CADRPPNSOYOe3vuUFEp3z-1RX6QHmRFJpxHTCLhniX-0hh2T01Q@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: fix the module name for disable_bypass
 parameter
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Will Deacon <will.deacon@arm.com>, lkml <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Tue, Feb 11, 2020 at 5:47 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Tue, Feb 11, 2020 at 05:36:55PM -0600, Li Yang wrote:
> > Since commit cd221bd24ff5 ("iommu/arm-smmu: Allow building as a module"),
> > there is a side effect that the module name is changed from arm-smmu to
> > arm-smmu-mod.  So the kernel parameter for disable_bypass need to be
> > changed too.  Fix the Kconfig help and error message to the correct
> > parameter name.
>
> Hmm, this seems to be a user-visible change - so those of us who have
> been booting with "arm-smmu.disable_bypass=0" now need to change that
> depending on which kernel is being booted - which is not nice, and
> makes the support side on platforms that need this kernel parameter
> harder.

I have sent a new patch replacing this patch.  That patch will keep
the command line unchanged.

>
> >
> > Signed-off-by: Li Yang <leoyang.li@nxp.com>
> > ---
> >  drivers/iommu/Kconfig    | 2 +-
> >  drivers/iommu/arm-smmu.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index d2fade984999..fb54be903c60 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -415,7 +415,7 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
> >         hardcode the bypass disable in the code.
> >
> >         NOTE: the kernel command line parameter
> > -       'arm-smmu.disable_bypass' will continue to override this
> > +       'arm-smmu-mod.disable_bypass' will continue to override this
> >         config.
> >
> >  config ARM_SMMU_V3
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index 16c4b87af42b..2ffe8ff04393 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -512,7 +512,7 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
> >               if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
> >                   (gfsr & ARM_SMMU_sGFSR_USF))
> >                       dev_err(smmu->dev,
> > -                             "Blocked unknown Stream ID 0x%hx; boot with \"arm-smmu.disable_bypass=0\" to allow, but this may have security implications\n",
> > +                             "Blocked unknown Stream ID 0x%hx; boot with \"arm-smmu-mod.disable_bypass=0\" to allow, but this may have security implications\n",
> >                               (u16)gfsynr1);
> >               else
> >                       dev_err(smmu->dev,
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
