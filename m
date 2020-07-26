Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949A22E178
	for <lists.iommu@lfdr.de>; Sun, 26 Jul 2020 18:54:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 03E55878BD;
	Sun, 26 Jul 2020 16:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEmGxjQIpU-U; Sun, 26 Jul 2020 16:54:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0025D87908;
	Sun, 26 Jul 2020 16:54:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D82C9C004D;
	Sun, 26 Jul 2020 16:54:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9993DC004D
 for <iommu@lists.linux-foundation.org>; Sun, 26 Jul 2020 16:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 866F687E5C
 for <iommu@lists.linux-foundation.org>; Sun, 26 Jul 2020 16:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XN-d0gLNdhxP for <iommu@lists.linux-foundation.org>;
 Sun, 26 Jul 2020 16:54:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A614F87E5B
 for <iommu@lists.linux-foundation.org>; Sun, 26 Jul 2020 16:54:40 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id kq25so1748613ejb.3
 for <iommu@lists.linux-foundation.org>; Sun, 26 Jul 2020 09:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CBVgBFjkce72YAGTOc2I0NfR2QTyjZahMOR47tbfoe0=;
 b=WZYXiUPxENKn4QSxY7fPf+iBaAhsNwecbIqIua+YO2effyaCG04XLdhlYe/ugtAfun
 1fXbuueu1sL3HDK5Dtsz0YubABpEtjbQo7eptsxI/lBXgWB/3WVVVEEmE5w+FLXH6uKi
 ZIeZey8Cvr8anwVeJAwUu0rt41msmaOcLhKWamXZ4XPPQloplOSyM69HBfahGiFQeaKe
 VdrYrSXa5wP7b1gmFMJiWqd2K8TOxBosAvi2Z9c8hlyuujPC5uhKq+dgDVj4VMpUybxU
 kiYkfmIFSDy/R08StwIylDGo6dkk0/l7B5Clr00ZfG0Jw2OpT/++z7w9JMSJTwfmA6aD
 AyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBVgBFjkce72YAGTOc2I0NfR2QTyjZahMOR47tbfoe0=;
 b=Eqb4efe0jNxF3sH7+huo+fTtBgKMe/50GFITXE1hZzxz8YVDZ1nd4Gc53lm3uv5Ouh
 xSvwaF4T4u5vQk44T3NsxCO5w7BqihUR5oJKUFO9v3Ml715ltQW2HuQ/L+Tn3zkgV6Pf
 5IrvX3EgYF+m1ohbqb21sweesa4fBuG1cZ5/7FXaE+wb/5I+4i9Lnaruy7Oz8U/ITsxT
 8ebbQ5cEndRdOVLzFDBNK5+7XGOwEvzFG2ghpEUVXRyvxJQ9LC66ipGV97dJFHdOgqDn
 pydv1Tv5mKI89ZVuO7XdZZF5JbiPsiO1IsA5F4/NcVkk3LGvj6ev/s/jVgz27VQjnKf6
 O2gg==
X-Gm-Message-State: AOAM530qnj/uOSXWRNX+j0P16kCtdTjEUMmDVs6rJCJYOSckryKnrcPW
 92KzRAvCNQQdzjS+7cX3NhMMTiOwZgvMoumN7h0=
X-Google-Smtp-Source: ABdhPJwDnlAPaImQnrQAApbQ+w+cGsIt/2VZqafSu7Ti4+lytmzJqD4dBVNo+ZeSue4XBagNFOp/lX3pdQrzVmj/eOM=
X-Received: by 2002:a17:906:f199:: with SMTP id
 gs25mr1970599ejb.161.1595782478958; 
 Sun, 26 Jul 2020 09:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
 <20200720154047.3611092-8-jcrouse@codeaurora.org>
In-Reply-To: <20200720154047.3611092-8-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 26 Jul 2020 09:55:18 -0700
Message-ID: <CAF6AEGu50KtjFHJO3Txrbjnn1xoG5WDyuU_e__RsGPXe-5Z46g@mail.gmail.com>
Subject: Re: [PATCH v10 07/13] dt-bindings: arm-smmu: Add compatible string
 for Adreno GPU SMMU
To: Jordan Crouse <jcrouse@codeaurora.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
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

On Mon, Jul 20, 2020 at 8:41 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These

minor detail: this is true for a3xx and later but not a2xx ;-)

> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index d7ceb4c34423..e52a1b146c97 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,10 @@ properties:
>                - qcom,sc7180-smmu-500
>                - qcom,sdm845-smmu-500
>            - const: arm,mmu-500
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> +        items:
> +          - const: qcom,adreno-smmu
> +          - const: qcom,smmu-v2
>        - items:
>            - const: arm,mmu-500
>            - const: arm,smmu-v2
> --
> 2.25.1
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
