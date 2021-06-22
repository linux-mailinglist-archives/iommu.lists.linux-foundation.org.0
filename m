Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id F18CB3B0A45
	for <lists.iommu@lfdr.de>; Tue, 22 Jun 2021 18:25:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EC54032B;
	Tue, 22 Jun 2021 16:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTuLiHAY4lfA; Tue, 22 Jun 2021 16:24:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7608440311;
	Tue, 22 Jun 2021 16:24:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E618C000E;
	Tue, 22 Jun 2021 16:24:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 671F0C000E
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 16:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 497E6606D6
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 16:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AgkM78V0Otji for <iommu@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 16:24:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD1B76066B
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 16:24:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6492260FE7
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624379096;
 bh=9YcXrpKKqcySYVdTGcAYXn0Qnpqnm7JMdtLyxXuKF3k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r2j/rbAmBjtCqXDc5B4JpXikk0tmxMLUUd9le6SyIbiRvSqJx5pdmzLtwcLN35j+R
 vWT/hU1Uj//iHS25xbDzWJ5IWLa+I2nLjPo4Iz568RGf1gLo9IyFucDOh3z/0c6MDK
 ++ypeeccrWdsg6LzKYIFj5qsE1rJqVzBaJU/sSQpwIMRudiDPalnlYFtVgm4HpfDte
 wKOnwsx/JXvUWnkYf1Z3qiV9+p08FMYIjSI3h/SDOvd9pE07BmID3rc5okHAcrg5gd
 kWapq3K0V2fF6grUX0A0XoprrrjbIoagkRpop4JCaRjKLaGbOXZ12Zz884jdilEwvG
 L23+0Z8Y0VHNw==
Received: by mail-ed1-f53.google.com with SMTP id r7so24448786edv.12
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 09:24:56 -0700 (PDT)
X-Gm-Message-State: AOAM531Mz0Nhd1OFPcGfcLs21NoiXETsVxKgmlZyKOzuGCkQGtKbuDvw
 Pi4f/XAzhDibHCmEqTjTw8mC6Liamwqfb8QpfQ==
X-Google-Smtp-Source: ABdhPJz2hJEe5Y5tnMkc8uKDAV4QNLw9/gGuefIt+WY3Hctlj1z/OSB0gS6FMkhV1XgFau+MVMbXqfZfYqQPWOxl+gQ=
X-Received: by 2002:aa7:cac9:: with SMTP id l9mr6122024edt.373.1624379095019; 
 Tue, 22 Jun 2021 09:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210621140036.2879563-1-thierry.reding@gmail.com>
In-Reply-To: <20210621140036.2879563-1-thierry.reding@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 22 Jun 2021 10:24:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK4zFzWGG=j1yqGfCwt7p_k=ExhN64+RxeBYB4PqDGvXg@mail.gmail.com>
Message-ID: <CAL_JsqK4zFzWGG=j1yqGfCwt7p_k=ExhN64+RxeBYB4PqDGvXg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm-smmu: Fix json-schema syntax
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Will Deacon <will@kernel.org>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On Mon, Jun 21, 2021 at 7:58 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Commit 4287861dca9d ("dt-bindings: arm-smmu: Add Tegra186 compatible
> string") introduced a jsonschema syntax error as a result of a rebase
> gone wrong. Fix it.
>
> Fixes: 4287861dca9d ("dt-bindings: arm-smmu: Add Tegra186 compatible string")
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
