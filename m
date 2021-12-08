Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07E46D612
	for <lists.iommu@lfdr.de>; Wed,  8 Dec 2021 15:49:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CCD583E74;
	Wed,  8 Dec 2021 14:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HF7ofrRE39e; Wed,  8 Dec 2021 14:49:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8EE9D82B1B;
	Wed,  8 Dec 2021 14:49:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BED6C006E;
	Wed,  8 Dec 2021 14:49:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 018F9C0012
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 14:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7D6E607E8
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 14:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ul_RSdwLtpHo for <iommu@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 14:49:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D406607F9
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 14:49:42 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id l22so6049675lfg.7
 for <iommu@lists.linux-foundation.org>; Wed, 08 Dec 2021 06:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A6AQ5RwsLshkjaFWGygq+igXovLHIdNbBW/Y1yrIsSE=;
 b=edtbly6D/+OT8HwkDGJjQMmmvUukDQwJxH9sektWgq+2vtrnEXgDPIuLQDZbMCzUjT
 ehn3E69bsJvREITJaO6njTL6s1x0unRO/pDj5eudgb+6zzMSYv3dPxkgMZzFs58zY1oH
 1CiuLQr49p3v0K9geojMUA5KnICmmtlfVD5zYwcUTCdA4zMsgiPkrWOxT+J+0+ZwZD/T
 9qhv/qCNra5Uq8URmoQm9J3TtV17adJ7RIBeg7Zxc/RVQcDZ9picNCW8lMy7hwwS38FW
 v1rUR6yoWqRklJCsHsPFMZZaxxSzeqfNI/VaCCKTkM3QoJeKMdLvSDyGxF9zSZxx6pwQ
 ko8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6AQ5RwsLshkjaFWGygq+igXovLHIdNbBW/Y1yrIsSE=;
 b=bRDkX9ImGC+qKFLyi6uQtc2g7YtsVhS529OdVWJGn7ogwXykvbBTlclyGcf7ybSvGx
 DpDkLiTAbo9tYbL67At9s9Ump9WeNcegsik4GWHpGQSm9+SDYSxlfr3o3Kod+QQ6frcm
 TYuD+2H9eDHeNrfRvHaz6xnS4ESb0+K78Dd/M19eW+yovM1JPLUe5wieJBk44U0kDF22
 7UGg8CK076H7MnYnshOYzlFn3D9jrXUPdF15KzredzWk/U3bMFx/OnglU7/q70sQNroL
 GpFNUM8L4MYkITutCVz3I7r9vJG7uKBpHXU8bwz8QwwE3RShfcgzRmlMBGH30eU5SGMt
 u4Ng==
X-Gm-Message-State: AOAM533FNIPfptbd9i+ekgc5SPLg4EBvkNyyQmuIcZ5fydA4InF9m1nZ
 wvRyJaRcBKx39uXF1lP6kQk=
X-Google-Smtp-Source: ABdhPJwaNMhyxPX38YKJFrCYdx3ruEto3eCjl/TlMxD+eADMt56U216NfdKzrYehTDrBsbArMabrMw==
X-Received: by 2002:a19:dc1a:: with SMTP id t26mr47903524lfg.315.1638974981163; 
 Wed, 08 Dec 2021 06:49:41 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id w15sm272697lfe.184.2021.12.08.06.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 06:49:40 -0800 (PST)
Subject: Re: [PATCH v7 6/6] iommu/tegra-smmu: Add pagetable mappings to debugfs
To: Nicolin Chen <nicolinc@nvidia.com>, thierry.reding@gmail.com,
 joro@8bytes.org, will@kernel.org
References: <20211208084732.23363-1-nicolinc@nvidia.com>
 <20211208084732.23363-7-nicolinc@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ccb06bfc-8ba3-b3b2-b550-d8c491082ef5@gmail.com>
Date: Wed, 8 Dec 2021 17:49:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208084732.23363-7-nicolinc@nvidia.com>
Content-Language: en-US
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jonathanh@nvidia.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

MDguMTIuMjAyMSAxMTo0NywgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gKwkJc2VxX3ByaW50
ZihzLCAiXHRcdCUtMTRzIHwgJS00cyB8ICUtMTBzJXMgfCAlLTEwcyVzIHwgJS0xMXNcbiIsCj4g
KwkJCSAgICJQVEUgUkFOR0UiLCAiQVRUUiIsCj4gKwkJCSAgICJQSFlTIiwgc2l6ZW9mKHBoeXNf
YWRkcl90KSA+IDQgPyAiICAgICAgICAiIDogIiIsCj4gKwkJCSAgICJJT1ZBIiwgc2l6ZW9mKGRt
YV9hZGRyX3QpICA+IDQgPyAiICAgICAgICAiIDogIiIsCgpDYW4gd2UgY2hhbmdlIElPVkEgdG8g
dTMyPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21t
dSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
