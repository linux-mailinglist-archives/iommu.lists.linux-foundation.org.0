Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2569224A50E
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 19:37:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C438486246;
	Wed, 19 Aug 2020 17:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULL9KDTWBZlt; Wed, 19 Aug 2020 17:37:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71DA38622A;
	Wed, 19 Aug 2020 17:36:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6183CC0051;
	Wed, 19 Aug 2020 17:36:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F05CC0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0DCCA857BF
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUX_8LuuA-wE for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 17:36:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6FFBB8579E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:36:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a14so22343754wra.5
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+bhGv6x9d7Md61hsuFNIkfPq3bcxtQviu/6k9haxoN4=;
 b=Y4Yn43JUJRrnzNlVJ+qfW7bTGDlgp2KtAFgWc1ZC9OPN4PtPcF9CK1XSQ8U3PFJ1Tu
 Bsm+r/sys5RMoWP28GmgJYpsd37KV1EcicLfj3QOLnX3TPMxtYJJVk1yCM3Y0w3kIfhY
 EmQpu3G85KwwwpgqHDimPq1NhbMCE0REYYYcDYMlfiMBhnyGJSOPmgpqKDb6bTqvXRAm
 VcjvxvQwfzAM+GBK2aL091eP/ab/HYq1kim9ftBGy5zXWJLGTve5gyYsJ6xOvtaphH+n
 k6y63OsFV5RRYbksUcCsack5Rbaa1ukiRgAA0dZwr3rmhwOi/ViiIumPfhNQjS0qK2jj
 mTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+bhGv6x9d7Md61hsuFNIkfPq3bcxtQviu/6k9haxoN4=;
 b=UPhqx1z7Zf5r9i+WfqJ8/1MgnqbhBpR2MZjBgohUnqHwQ6Hb3FGPj8JjVUYq2qLWcs
 jb6aFIiK1DGoxpeIR5x188Lg8rNJzNucf23uWBW/Kl2qzChOsUpS/RVCmYMzd/aM5K8k
 rf9kwscfRKWvdwHWdEfGQAIEzqc+sTsPQqQY2c1szkZ97QoHqE3KO1TKI3l9NmEIxKSF
 eoj8J5uicxODii3dJsXTZIIf9YhZZSDeORkT5TMpKAL+v0M4ztA+WIWx+6muU4KftEZJ
 Cx90SaL9CaBCIqACGw2DN4dm/Ui0Zt6r8/eCO6DVnYYEi4x+lzKpqApmafe89GIikwYb
 m+mg==
X-Gm-Message-State: AOAM530lwliMNhADKVnbnokaRZViwFs4gXnd4623/MLOndg+dSFBmTrm
 Oixwap20VTXOLpVtUCPgzjt9MhdGxpz1a4j5vSM=
X-Google-Smtp-Source: ABdhPJzglAj2zEcuSTfR/ApGNCwL58mvFBlYw3kwcRHOHl7jcRz0JgVZV5GKXtIiD8j0Ohle/G/9WooWDkBOpUVFHgw=
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr4835046wrq.327.1597858609658; 
 Wed, 19 Aug 2020 10:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com>
 <20200817220238.603465-11-robdclark@gmail.com>
 <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
In-Reply-To: <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Aug 2020 10:36:38 -0700
Message-ID: <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
Subject: Re: [PATCH 10/20] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
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

On Wed, Aug 19, 2020 at 10:03 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 17, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Jordan Crouse <jcrouse@codeaurora.org>
> >
> > Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> > devices depend on unique features such as split pagetables,
> > different stall/halt requirements and other settings. Identify them
> > with a compatible string so that they can be identified in the
> > arm-smmu implementation specific code.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 503160a7b9a0..5ec5d0d691f6 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -40,6 +40,10 @@ properties:
> >                - qcom,sm8150-smmu-500
> >                - qcom,sm8250-smmu-500
> >            - const: arm,mmu-500
> > +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> > +        items:
> > +          - const: qcom,adreno-smmu
> > +          - const: qcom,smmu-v2
>
> I know I'm kinda late to the game, but this seems weird to me,
> especially given the later patches in the series like:
>
> https://lore.kernel.org/r/20200817220238.603465-19-robdclark@gmail.com
>
> Specifically in that patch you can see that this IOMMU already had a
> compatible string and we're changing it and throwing away the
> model-specific string?  I'm guessing that you're just trying to make
> it easier for code to identify the adreno iommu, but it seems like a
> better way would have been to just add the adreno compatible in the
> middle, like:
>
>       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
>         items:
>           - enum:
>               - qcom,msm8996-smmu-v2
>               - qcom,msm8998-smmu-v2
>               - qcom,sc7180-smmu-v2
>               - qcom,sdm845-smmu-v2
>         - const: qcom,adreno-smmu
>         - const: qcom,smmu-v2
>
> Then we still have the SoC-specific compatible string in case we need
> it but we also have the generic one?  It also means that we're not
> deleting the old compatible string...

I did bring up the thing about removing the compat string in an
earlier revision of the series.. but then we realized that
qcom,sc7180-smmu-v2 was never actually used anywhere.

But I guess we could:  compatible = "qcom,sc7180-smmu-v2",
"qcom,adreno-smmu", "qcom,smmu-v2";

BR,
-R




>
> -Doug
>
>
> >        - description: Marvell SoCs implementing "arm,mmu-500"
> >          items:
> >            - const: marvell,ap806-smmu-500
> > --
> > 2.26.2
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
