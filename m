Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 036741AD824
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 10:01:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AC2A08764F;
	Fri, 17 Apr 2020 08:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opIOjLF83gKY; Fri, 17 Apr 2020 08:01:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6C5787659;
	Fri, 17 Apr 2020 08:01:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CEDAC0172;
	Fri, 17 Apr 2020 08:01:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 499DBC0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 08:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 32DC4226F5
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 08:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j89+Ke7job32 for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:01:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 9CBC62269B
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 08:00:42 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id d21so272268ook.10
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 01:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xHhu0kspZ14qeBXGO9rKCMyphZAfBrfaLwo1PwMniTE=;
 b=Wo/KlT9ERLVTTfVMubPs8ta93v+yWOf5jyxui/Kbn3dHlQuJCSdhuRYiGZp9uw0s4G
 FQbl+uIxG6XIRv0rKR9C5FsGL8K8Bk0Rp0fdNRR8CbVLn2y4lBpAx6j3HLkc0qSzQr57
 HX4NVI3Xij2toUlzIahDuU7YWHA3yrmpabXcDu0ddFcUyXAhXWHBAbBQ1O/4xfPQHBsr
 Ky10yySQ7TCAAkBTKDyphuKKBAyog0HwOjm8VN9BZ0Jj3AeCttXHFReccW21W/hsHbjU
 6Vc4jaznHs2zAPF3zo0PbncXwptLQ3vYtVuDIgLepSPtf0eW+E94Ln/vepKkUgU6MKKH
 sSLg==
X-Gm-Message-State: AGi0Pua+8JLbpGuYTSijU4FplBHkhFPWaVT2rPIzjzc8hSVvYGAcnyzA
 ++wZ0KirMm7K6Rb70sOkhKh9WXYQokfqCCSTVCs=
X-Google-Smtp-Source: APiQypIcw/l+vgYHRaoQmnHZKfU4V4tlbrMUUMpjk5XZHHi9k+Xxr+phFeKqAp2KqMP/WxKicbFvQNxyRmCFUc/aL70=
X-Received: by 2002:a4a:4c46:: with SMTP id a67mr1536212oob.1.1587110441872;
 Fri, 17 Apr 2020 01:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <1587106953-1415-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1587106953-1415-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2020 10:00:30 +0200
Message-ID: <CAMuHMdWJRXLRf1Qk0iALaTaqw+KYThM10KEbdDWzFoQjOtPVtg@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: iommu: renesas,
 ipmmu-vmsa: convert to json-schema
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>
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

Hi Shimoda-san,

(not related to the json-schema conversion)

On Fri, Apr 17, 2020 at 9:03 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> +  renesas,ipmmu-main:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Reference to the main IPMMU instance in two cells. The first cell is
> +      a phandle to the main IPMMU and the second cell is the interrupt bit
> +      number associated with the particular cache IPMMU device. The interrupt
> +      bit number needs to match the main IPMMU IMSSTR register. Only used by
> +      cache IPMMU instances.

Note: Apparently the master IPMMU instance has an interrupt bit number
in the MMU Interrupt Status Register, too.  This is currently not
described in DT, as no renesas,ipmmu-main property is present for the
master instance.  Currently this doesn't matter, as the driver doesn't
use the interrupt bits at all.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
