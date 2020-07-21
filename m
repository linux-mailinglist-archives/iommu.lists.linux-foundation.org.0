Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D8228314
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 17:04:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DDF5846D3;
	Tue, 21 Jul 2020 15:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwkqB1Cc1Ua9; Tue, 21 Jul 2020 15:04:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDF4C8868B;
	Tue, 21 Jul 2020 15:04:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C15E4C016F;
	Tue, 21 Jul 2020 15:04:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D5ECC016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 15:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 26D4988651
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 15:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhK1P8TZuQ3p for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 15:04:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6CDDF87839
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 15:04:49 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id rk21so21995473ejb.2
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/WjG1I1jw+gA2WhVK85qv6i+E0OUDyTrccx3Mlc7NQ=;
 b=YK4OMZ0XyyX1/+bnU5uyRqXAPi/NwezYZaL+3SQ/21qjHrQvQLB5QpTBCGqvSpfp2G
 0dvwYRP2ggj8iJi1OFLEc31LD/505o64O72+/gTxoOZo76Ndlm3mGjn2EZv/v3G6+v4a
 aKSmHBy1odMqQ7JRmYtoXEwS7f1gQ80r15lfBdhYEhTjVZMovK7UqEUBiH2Q2fqM/ocX
 +MXyHN/tmxYATerUHB9o6fDhGL+9FS/qmTCpWlTNbDwE0ediAtl2ZW9ncZW7nHeQSIGm
 A9fkEK5kJth3K/5fZzZK8QDZ7eH9+cZYIb2athqhWpi5JDknWKM5MevSvPLujUL5Ns9o
 VsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/WjG1I1jw+gA2WhVK85qv6i+E0OUDyTrccx3Mlc7NQ=;
 b=T1h0L6PuqMHyrPwprWKiRwx+R5Fd5LQHnwvCe/KJ9rPx47mGz6DKqMjjmR1rn/crm3
 AVSArl6NANk8BePnF+9b00ELeHqQXjGmLnj2t3CJc79bcjLPiH/P3YZ9W9uIhn0oN3Xr
 dn37mBlatzicrOERnAkN19tQlVrsL6zidDhRHCaiazakSLnW+IozK+mppvNg/rF4fasa
 0Q3/mdcGKonkTaPd2TH2YvzSV625XTgFXULcpUqryEK1xjiaop+DdKfijSLsS6cO2d2d
 DOcNaIsqfgU2//rB07BXJXXK6tqdwihAzuQTjJa/MZGt86vMvR4vD0rpnsEhB380s+fx
 XCVQ==
X-Gm-Message-State: AOAM532GORJHUv2RuIERiCs1rIfXqQedRjuxp9QTnWfSt69LRlOPNlec
 xdkd16T772dZfHH9DHlMncPQG3Bka/+XYLqMOJc=
X-Google-Smtp-Source: ABdhPJyUPjX5E5t4LX3TbhkOYN5/ZjIzw5tH08WLxfBJzEMURod+CD9+rMNIPF5jUFqS644hvbpGtTtu+Lo5lbvFQ98=
X-Received: by 2002:a17:906:40cb:: with SMTP id
 a11mr24668088ejk.340.1595343887718; 
 Tue, 21 Jul 2020 08:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200704122809.73794-1-konradybcio@gmail.com>
 <20200704130922.GB21333@willie-the-truck>
 <20200705033511.GR388985@builder.lan>
In-Reply-To: <20200705033511.GR388985@builder.lan>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Tue, 21 Jul 2020 17:04:11 +0200
Message-ID: <CAMS8qEWO-1mNd12Zs-2WogCrgNF5=6RkF=Z1pTeOZxSuKjx+qg@mail.gmail.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu: Implement qcom,skip-init
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: DTML <devicetree@vger.kernel.org>, skrzynka@konradybcio.pl,
 Will Deacon <will@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 John Stultz <john.stultz@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
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

So.. is this a no-no?

I of course would like to omit this entirely, but SMMUs on sdm630 and
friends are REALLY picky.. What seems to happen is that when the
driver tries to do things the "standard" way, hypervisor decides to
hang the platform or force a reboot. Not very usable.


This thing is needed for the platform to even boot properly and one
more [1] is required to make mdss work with video mode panels (the
fact that CMD-mode panels work is kinda hilarious to me).

To be honest, there are even more qcom quirks (of which at least
qcom,dynamic and qcom-use-3-lvl-tables are used on 630).. [2]

Looking forward to your answers and possibly better solutions.

[1] https://github.com/konradybcio/linux/commit/83ac38af259968f92b6a8b7eab90096c78469f87
[2] https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.7.1.r1/drivers/iommu/arm-smmu.c#L404-L415

Regards
Konrad
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
