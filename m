Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B7969162CDE
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 18:30:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6834485B81;
	Tue, 18 Feb 2020 17:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VM4CxTfg_tJl; Tue, 18 Feb 2020 17:30:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C08685B4A;
	Tue, 18 Feb 2020 17:30:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5601EC013E;
	Tue, 18 Feb 2020 17:30:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8ADA4C013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7611F85B4A
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7P-xouG9zH5 for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 17:30:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E2CB185B09
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:30:48 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A30D124673
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582047048;
 bh=f24u0w8tQoL2c68hjjz5dANYHmhosIHGEhO+odsYIr8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T6Skmi1JCrTd0r3/G9yHqfgDHp7hISOOYSjf1yT/GR5p+tYFwRVbw/iSb5LWEArGF
 mZS9hbe10oSvt3Ig1ua9xVU5nZsJCKy9EBaj34hkBoXOshnXt7negsGf1praGgRXnT
 gII8dIhJZp8j5HtUc/Bcr0QjJfcwsoKEc2tOv7OE=
Received: by mail-qt1-f178.google.com with SMTP id c5so15068051qtj.6
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 09:30:48 -0800 (PST)
X-Gm-Message-State: APjAAAWUCRUCkREZ11+0XyGJ3qEYKFmE69dx+2rLSXwylp7ybey09ueV
 Dw96Kldq9qxC2o+dRedn57bTgcGeImLXgJgY1Q==
X-Google-Smtp-Source: APXvYqyKj1XrrS2dTlNVqxYWIJKezDSkWldRHC5sXeMDLgXFrTGaR+gYe9EBl+bwCy+V5saC7oDA910oSACmfefPodM=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr18731255qtj.300.1582047047680; 
 Tue, 18 Feb 2020 09:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20200218171321.30990-1-robh@kernel.org>
 <20200218171321.30990-12-robh@kernel.org>
 <20200218172255.GG1133@willie-the-truck>
In-Reply-To: <20200218172255.GG1133@willie-the-truck>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Feb 2020 11:30:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJtdJmbWtwV00sa_A2tv-jy-JpKWUfco-LU4Dt2pTvHeg@mail.gmail.com>
Message-ID: <CAL_JsqJtdJmbWtwV00sa_A2tv-jy-JpKWUfco-LU4Dt2pTvHeg@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] dt-bindings: Remove Calxeda platforms bindings
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

On Tue, Feb 18, 2020 at 11:23 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Feb 18, 2020 at 11:13:21AM -0600, Rob Herring wrote:
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/calxeda.yaml      | 22 ----------
> >  .../devicetree/bindings/arm/calxeda/l2ecc.txt | 15 -------
> >  .../devicetree/bindings/ata/sata_highbank.txt | 44 -------------------
> >  .../devicetree/bindings/clock/calxeda.txt     | 17 -------
> >  .../memory-controllers/calxeda-ddr-ctrlr.txt  | 16 -------
> >  .../devicetree/bindings/net/calxeda-xgmac.txt | 18 --------
> >  .../bindings/phy/calxeda-combophy.txt         | 17 -------
>
> You can drop the "calxeda,smmu-secure-config-access" from the Arm SMMU
> binding doc too (either here, or as part of the other patch).

Glad someone is paying attention. :)

Will do it as part of this patch.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
