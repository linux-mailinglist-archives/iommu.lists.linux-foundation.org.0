Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7083C5E1B
	for <lists.iommu@lfdr.de>; Mon, 12 Jul 2021 16:14:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 501B040178;
	Mon, 12 Jul 2021 14:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umD-mqCdgOmx; Mon, 12 Jul 2021 14:14:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 855514018F;
	Mon, 12 Jul 2021 14:14:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60B8BC000E;
	Mon, 12 Jul 2021 14:14:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58B3DC000E
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 14:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 488334018F
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 14:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5UpZN33xTOV for <iommu@lists.linux-foundation.org>;
 Mon, 12 Jul 2021 14:14:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4DCA40178
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 14:14:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 708086101D
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626099294;
 bh=M7RO+RWPIWf1rQ0XqWqxE/RpS+BV7Z3JI+wL6wmiVKM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pmLakHO3vrLY46iKPBqiAMsjDZB+ZCK1NeC8ZQRa3DpesodNuc3zbT3G9gvzlxpZd
 qXGRClOulRighbevWXdK1/FL8KdpEezSi4Svl8z+O01ay6IZ2SHv67xBvSzY5ayjBF
 LsJoqxosEe/vmBf6PV2emjnWx48vDPjFPl3g1tKUJ3izKOQHQSMfal9ecQcWHacZXM
 eTJF1vQGTHG6GGeZqIraqju0gDLs+Sp2yXj0/knwWyQcZqVlj+yqC9iVXTQSGVwK5V
 HDZQVmMter7cEItJV62mU1EUVIC+gEiLT2dxRpToepbjcYLBq9levBA83Ogdrbyobs
 JHne5Poxd+hzQ==
Received: by mail-ed1-f51.google.com with SMTP id v1so28244679edt.6
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 07:14:54 -0700 (PDT)
X-Gm-Message-State: AOAM533B/cRk57zU9MDiz51COlFw22VWi1P1DYKv9ye3VrFtyALFu7TF
 inwyvZcoqIW6jKZU1ZpIQ7H9iX6aL5IHw+SbDA==
X-Google-Smtp-Source: ABdhPJwxFNeu4wAHDnUBgPJUAs8EZ3+VHvO9PoFbz+ttM23NmS8zTLIb6XxscDAS5VTuu0SP15AcETtLc6co95gJxOY=
X-Received: by 2002:aa7:c89a:: with SMTP id p26mr10847846eds.373.1626099293098; 
 Mon, 12 Jul 2021 07:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210621140036.2879563-1-thierry.reding@gmail.com>
 <162442779339.5511.14827117243689906234.b4-ty@canonical.com>
In-Reply-To: <162442779339.5511.14827117243689906234.b4-ty@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 12 Jul 2021 08:14:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3WMOrPNzF-juqL8y20dAjt0BZaZU-yLnekKKCjTqmMA@mail.gmail.com>
Message-ID: <CAL_JsqL3WMOrPNzF-juqL8y20dAjt0BZaZU-yLnekKKCjTqmMA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm-smmu: Fix json-schema syntax
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, Robin Murphy <robin.murphy@arm.com>
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

On Tue, Jun 22, 2021 at 11:56 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On Mon, 21 Jun 2021 16:00:36 +0200, Thierry Reding wrote:
> > Commit 4287861dca9d ("dt-bindings: arm-smmu: Add Tegra186 compatible
> > string") introduced a jsonschema syntax error as a result of a rebase
> > gone wrong. Fix it.
>
> Applied, thanks!
>
> [1/1] dt-bindings: arm-smmu: Fix json-schema syntax
>       commit: bf3ec9deaa33889630722c47f7bb86ba58872ea7

Applied where? Now Linus's master is broken.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
