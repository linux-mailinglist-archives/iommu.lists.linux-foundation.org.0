Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AA916F265
	for <lists.iommu@lfdr.de>; Tue, 25 Feb 2020 23:02:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 807B18241E;
	Tue, 25 Feb 2020 22:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98sr0J6e3dZN; Tue, 25 Feb 2020 22:02:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 74ABF82417;
	Tue, 25 Feb 2020 22:02:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A144C1D8E;
	Tue, 25 Feb 2020 22:02:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19594C0177
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 22:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0691C203A0
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 22:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fv9EyVY-br1z for <iommu@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 22:02:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0ADCB203B4
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 22:02:07 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A386724656
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 22:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582668126;
 bh=ASA6axefWklSU78pWejTSwer0ZOaWKFTnH47gYDjOZA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CTCD9kg9XuK/5B5/i8D8A/5G6NN6eG+R/lePr4JYYbypdV7FZygukNX4N2vScKNMR
 AcowiA3TsPtPrp9pjfqln0aJMCgno1iOeRyF4hIx8g2f5Ai/mJTN4X1rrllv43N8WQ
 yeXIAeDINI5iDpqzRb+S/V40752h2KdAmsoPsWz0=
Received: by mail-qk1-f169.google.com with SMTP id 145so757990qkl.2
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 14:02:06 -0800 (PST)
X-Gm-Message-State: APjAAAX+SQxjsmBJkhgD2IhgbSErzIxxRZllO2Ymq68fmI7NWdR05M36
 MYytFWDiTiMCfg5VYM6a4pURX4fDBJ0bOk2T/w==
X-Google-Smtp-Source: APXvYqw5XKZGdHCXY9u0tVRDbjlPaa0iutz4jC8T9d3E9Z8AVXYJLUY39qJiOoxuGit3bif1zq9Awqp6HaEj5QU++i0=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr1310560qkg.152.1582668125762; 
 Tue, 25 Feb 2020 14:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20200218171321.30990-1-robh@kernel.org>
 <20200218171321.30990-7-robh@kernel.org>
 <20200218172000.GF1133@willie-the-truck>
In-Reply-To: <20200218172000.GF1133@willie-the-truck>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Feb 2020 16:01:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJn1kG6gah+4318NQfJ4PaS3x3woWEUh08+OTfOcD+1MQ@mail.gmail.com>
Message-ID: <CAL_JsqJn1kG6gah+4318NQfJ4PaS3x3woWEUh08+OTfOcD+1MQ@mail.gmail.com>
Subject: Re: [RFC PATCH 06/11] iommu: arm-smmu: Remove Calxeda secure mode
 quirk
To: Will Deacon <will@kernel.org>
Cc: Mark Langsdorf <mlangsdo@redhat.com>, kvm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 soc@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Tony Luck <tony.luck@intel.com>,
 Alexander Graf <graf@amazon.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-edac <linux-edac@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev <netdev@vger.kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robert Richter <rrichter@marvell.com>, James Morse <james.morse@arm.com>,
 Borislav Petkov <bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>,
 "David S. Miller" <davem@davemloft.net>
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

On Tue, Feb 18, 2020 at 11:20 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Feb 18, 2020 at 11:13:16AM -0600, Rob Herring wrote:
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: iommu@lists.linux-foundation.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Do not apply yet.
>
> Pleeeeease? ;)
>
> >  drivers/iommu/arm-smmu-impl.c | 43 -----------------------------------
> >  1 file changed, 43 deletions(-)
>
> Yes, I'm happy to get rid of this. Sadly, I don't think we can remove
> anything from 'struct arm_smmu_impl' because most implementations fall
> just short of perfect.
>
> Anyway, let me know when I can push the button and I'll queue this in
> the arm-smmu tree.

Seems we're leaving the platform support for now, but I think we never
actually enabled SMMU support. It's not in the dts either in mainline
nor the version I have which should be close to what shipped in
firmware. So as long as Andre agrees, this one is good to apply.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
