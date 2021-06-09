Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C793A1567
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 15:21:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E008B608E3;
	Wed,  9 Jun 2021 13:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bVv_-4Wp8G3; Wed,  9 Jun 2021 13:21:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 15363608C4;
	Wed,  9 Jun 2021 13:21:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE45FC0024;
	Wed,  9 Jun 2021 13:21:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 493B8C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 13:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F19E583C92
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 13:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AD1KnQBUAxIq for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 13:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1776783C7E
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 13:20:55 +0000 (UTC)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqy8b-0006fh-QJ
 for iommu@lists.linux-foundation.org; Wed, 09 Jun 2021 13:20:53 +0000
Received: by mail-wr1-f71.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so6802685wri.20
 for <iommu@lists.linux-foundation.org>; Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/jeQfD/PRU7+ZLKVWo4kW6eSKyG/9GBLEURDHxDyzY=;
 b=VdOUvn5aYY9JXr7SOQpquEkroxDWkwkv+ZcwwoENVFSnmKUSRY53SHZ0tY3s5g2CI4
 q3kGf3VRjhviucmKmnRqsS1S95rdapH6rD9R4KHZjKYrr8wmCHQlEDqR/gortIL4A5aB
 rzHAI3ZdhIE0dwEGAy83nPvRuUOBodqM5P4CdwWutQrioGw9tW2DWlvvmfqOmClyBdMd
 oVhdKXEQXptLnZPMn+D5LQLcEguvD1CbOTUEp312pGgIqouD37slOQV3Xww8KGoDpeNb
 sFnn3VlC9E45YuMwA98F2iB36RAWsEtp0CIXHn3fKAfLu7CwmyJW5xwvii9ViFcCbtuS
 wx6g==
X-Gm-Message-State: AOAM532dhPcXSqcmF+thMNu6DpHtcJGGEAzIHEMjVLYLw4y9fPQgZxyX
 GQAWYDCKJBu/T+Q/Ea4TiLNbusZrKm3N0f5mnfXK1Os9ZLUZjrbSvf5pqeDhSZImSMs7qgkFVLa
 43NDHuC87MkqSGhRRv90d2oKrfuTaseMqYLYcOXnUZdFQ91A=
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr28431590wrn.16.1623244853591; 
 Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPwIER/U8HjPgFdgQi+5438sNuC/K4BzQ7DUDd3BFdNyrQXv/3PhyC1zXgJG2F7mvCt819Hw==
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr28431577wrn.16.1623244853437; 
 Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id v15sm2086058wrw.24.2021.06.09.06.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <184b726d-fa8a-d708-df95-a0a7d1fcc58f@canonical.com>
Date: Wed, 9 Jun 2021 15:20:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On 07/06/2021 10:49, Krzysztof Kozlowski wrote:
> Hi Olof and Arnd,
> 
> Tegra memory controller driver changes with necessary dependency from Thierry
> (which you will also get from him):
> 1. Dmitry's power domain work on Tegra MC drivers,
> 2. Necessary clock and regulator dependencies for Dmitry's work.
> 

Hi Olof and Arnd,

Just FYI, the stable tag from Thierry which I pulled here (and you will
get from him as well) might cause COMPILE_TEST failures on specific
configurations. Regular defconfigs and allyes/allmod should not be affected.

I am giving heads up in case this lands in Linus later...

There will be two fixes for this, sent already by Thierry:
https://lore.kernel.org/lkml/20210609112806.3565057-1-thierry.reding@gmail.com/

1. reset controller stubs: going via reset tree,
2. reserved memory section: probably going via my tree later.


Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
