Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE32815CF
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 16:52:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3640986CCC;
	Fri,  2 Oct 2020 14:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DxwtMvaLR29N; Fri,  2 Oct 2020 14:52:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C0A5986CCE;
	Fri,  2 Oct 2020 14:52:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6D05C0051;
	Fri,  2 Oct 2020 14:52:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 830B7C0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7EB9486879
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QYhOHf0z8bb for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 14:52:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AAA6F8652A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 14:52:03 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id m5so2196710lfp.7
 for <iommu@lists.linux-foundation.org>; Fri, 02 Oct 2020 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cFiu94si6MLOrMmlNSPY2MN6ADJKMSBfebqq1SCmYCM=;
 b=p7HE9TVwD2q0fm2z18cHPxGP+a8ISNnzlYr+yR/x090A/zGwcNY5ZW9flfsG16aj98
 BnTp1gR014Gb3zDdg0lieJgOQ5GA6woCADJrSFqeFRiiTd+i7YGkJQcHezPyfydDEPaA
 0kh8AsyND1uv/1Y/rmjqHprWiC7cZaKvfqdioxLeuvh+ZileKopxodwjucv1LCKxCkGc
 KzShaALH5U2KiCE3l6cItae2tqBt5q+rdmtOpoEbsYG3cOOy5Qj1oX9gvJ+6a6ZrNocp
 /ooo9OVwoK59vZQgoDnRD8TRWjOy/yhnbMGZCgZJiRD0g5vLLKXYBs2vNwjo2ipWjWcO
 lghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cFiu94si6MLOrMmlNSPY2MN6ADJKMSBfebqq1SCmYCM=;
 b=bReglmoY2sTDlSRV/x88hfpHedOLmvGnWfWQ7tZGRQ7M87NhNOg3mVSTivsbWnHJQb
 XVgHSEfLEsF7OpczMqlJ4UkuxBBA9Zk+we7NElcbKwWvM5ZBkhwR8HZw6Iy+xxXTsSMc
 Rn9hGgF25NkgKRRtTD/JH9b6qp97DO+rxTg6wlRpOd+D4G4oyRfLIzz3s5N48MfEk3tA
 DC3zymZ3Kjv+pUIbC17qbRZxiqEGsG9xhabzpJ0OPYLzVOXewOMRZgJiGtm67G2yQn7u
 m1D53EHIlZPVBSBjWxKLhS7ykQVfVCZZO70Djt1NuMCvmyTKrw7WHd1AhzaW/sav9ATX
 6neQ==
X-Gm-Message-State: AOAM531cBWVo5DdkvjLlP6A97Yll50SWFB1aE8T5RP5XP9zcmWuECKe/
 kGoEhd3963L1b+F6emnn2B4=
X-Google-Smtp-Source: ABdhPJx/9txQPQLd4WiPCXriCCAjKKTfo2dbLn4ocnWSslz5gzwVhdj4WmsQmM19m6/YSyg2AWu93Q==
X-Received: by 2002:a05:6512:3692:: with SMTP id
 d18mr937803lfs.62.1601650322015; 
 Fri, 02 Oct 2020 07:52:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id m4sm256309ljb.58.2020.10.02.07.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 07:52:01 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
From: Dmitry Osipenko <digetx@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
 <75ad716f-aa2f-743a-7d9a-7083eda03672@gmail.com>
Message-ID: <cb90ebab-9800-c9b4-6fb7-3d53875195a0@gmail.com>
Date: Fri, 2 Oct 2020 17:52:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <75ad716f-aa2f-743a-7d9a-7083eda03672@gmail.com>
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

MDIuMTAuMjAyMCAxNzoyMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDIuMTAuMjAy
MCAwOTowOCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4+ICBzdGF0aWMgaW50IHRlZ3JhX3Nt
bXVfYXR0YWNoX2RldihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sCj4+ICAJCQkJIHN0cnVj
dCBkZXZpY2UgKmRldikKPj4gIHsKPj4gKwlzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMgPSBk
ZXZfaW9tbXVfZndzcGVjX2dldChkZXYpOwo+PiAgCXN0cnVjdCB0ZWdyYV9zbW11ICpzbW11ID0g
ZGV2X2lvbW11X3ByaXZfZ2V0KGRldik7Cj4+ICAJc3RydWN0IHRlZ3JhX3NtbXVfYXMgKmFzID0g
dG9fc21tdV9hcyhkb21haW4pOwo+PiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9m
X25vZGU7Cj4+IC0Jc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOwo+PiAgCXVuc2lnbmVkIGlu
dCBpbmRleCA9IDA7Cj4+ICAJaW50IGVyciA9IDA7Cj4gCj4gTG9va3MgbGlrZSB0aGVyZSBpcyBu
byBuZWVkIHRvIGluaXRpYWxpemUgJ2luZGV4JyBhbmQgJ2VycicgdmFyaWFibGVzCj4gYW55bW9y
ZS4KPiAKClNhbWUgZm9yIHRlZ3JhX3NtbXVfZGV0YWNoX2RldigpLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVA
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
