Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D2E22A096
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 22:12:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 828B988703;
	Wed, 22 Jul 2020 20:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJa7QjYRV05q; Wed, 22 Jul 2020 20:12:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0709A886F4;
	Wed, 22 Jul 2020 20:12:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E307AC004C;
	Wed, 22 Jul 2020 20:12:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C531C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 20:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 29D19203A8
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 20:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfxBLKVOacyJ for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 20:12:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 8039820387
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 20:12:11 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id z17so2625889edr.9
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLTkTEgt4xUndPHOWAIycnFkBJ6E45HfBo7NtTWjQFQ=;
 b=alnd3LC7bZF88GYjqDHdUOdzWFQohQLO9Zvh+1FMMZ/ID4cWZFhRotTy+TXlkoXEcf
 /R/ehmAb7jpmit194UXGc9oHqec/B+O6xg0Xi4GOVYWeopAdz+GgbJH4mtBQ3L/F/m/7
 6nuEk1jyoebnggTXW43/6lCtVcqTkYhJqL9NfUvfcg4Y3Zkp/E7L6EyLalgH29DAEicz
 2QuLDQthO5ZatNjafPEkj3YXlG8nab81KYeYJ8FrgNaJNJTNOCjhCCUfRCUI3LM5jZRr
 eQSYhuGhZTnw9eyUG6mJd6PFKgfPsTZBfG6nZJh+blW6cQC6zcwQVNjVtrQtUgKEYDh8
 /E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLTkTEgt4xUndPHOWAIycnFkBJ6E45HfBo7NtTWjQFQ=;
 b=t+UqSA1xuN9O+DqCgT/ruwt/FlBNSTYf60ZwJeYMLRqQSgMwDm/rDltiTTRmrv+H6w
 u7r790eTB6rql5gT/SpY6/GhEsZe5ysPErtKwSxzTQspWB5Y/WaigMHEmW6Odq7cMnxt
 kxiR8WminLR88DbHqr/mruhSYeOAx/bqVliNOW4TWj2GOdCh4f4ynRTiS3ep2qmq7NOh
 liSXyEefu9tBFtu91eCVgk2zkuA1bodECeNCwGFJsw4mWkHb+I1WyZyokainMl0wZ84K
 bvAplbD00YiEwO3in0uM1XsHNKCuyW9wiKZ/XqO+LEgIKaJiOdq17B4Ylnxx85kCE9wF
 xoAw==
X-Gm-Message-State: AOAM533mPQSs2wjgWlWgi8/0DUo3JmdyvHSBdX+LmJFUZueBP/drRiZI
 5fhriMPZOGHsDq7Xm7eH/MCTHzj2pQFWlVRkUZU=
X-Google-Smtp-Source: ABdhPJwD6t4bQXAbY3FRXxsABN08L0GguqxGCWf0AiDRNWyt939YcTYR9qUzVbF6BmoonWaoJpBlCZjucX05l9KQJZ4=
X-Received: by 2002:a05:6402:1ade:: with SMTP id
 ba30mr1031198edb.231.1595448729790; 
 Wed, 22 Jul 2020 13:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200704122809.73794-1-konradybcio@gmail.com>
 <20200704130922.GB21333@willie-the-truck>
 <20200705033511.GR388985@builder.lan>
 <CAMS8qEWO-1mNd12Zs-2WogCrgNF5=6RkF=Z1pTeOZxSuKjx+qg@mail.gmail.com>
 <20200721154415.GA5758@jcrouse1-lnx.qualcomm.com>
 <CAMS8qEXNh6n9SpMkPAr8cPneasPvJPELD2TZ4gxUf0byxNePbg@mail.gmail.com>
 <20200721235650.GN388985@builder.lan>
In-Reply-To: <20200721235650.GN388985@builder.lan>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Wed, 22 Jul 2020 22:11:34 +0200
Message-ID: <CAMS8qEVXGddTdbrPwK3NJMx71HH0hoVyqiJG6-g9tiBRMRYZ8w@mail.gmail.com>
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

>Is the problem on SDM630 that when you write to SMR/S2CR the device
>reboots? Or that when you start writing out the context bank
>configuration that trips the display and the device reboots?

I added some debug prints and the phone hangs after reaching the
seventh CB (with i=6) at

arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_FSR_FAULT);

line in arm_smmu_device_reset.

Konrad
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
