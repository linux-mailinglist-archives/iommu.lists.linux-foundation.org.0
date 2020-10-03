Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03D28246F
	for <lists.iommu@lfdr.de>; Sat,  3 Oct 2020 16:06:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AFD60869DA;
	Sat,  3 Oct 2020 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frv+o+BuIBDB; Sat,  3 Oct 2020 14:05:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2773486A02;
	Sat,  3 Oct 2020 14:05:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07946C0051;
	Sat,  3 Oct 2020 14:05:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BC9FC0051
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1E16B869DE
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdB8KdDBGxNw for <iommu@lists.linux-foundation.org>;
 Sat,  3 Oct 2020 14:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EB8D5869DA
 for <iommu@lists.linux-foundation.org>; Sat,  3 Oct 2020 14:05:55 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 77so5448015lfj.0
 for <iommu@lists.linux-foundation.org>; Sat, 03 Oct 2020 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P8VKZJgIOfKJQqqxkg2s++QEd40BwnCYRjtS8zyaB9g=;
 b=tJ7/eg7daE0NdushXX21Wxs1bod4oGp4wlBaQK3220LPx0VyyC45aevFobwKnVXCXk
 C/vy+nvb1Fw5OlcX4cYb303szLb0rBg7O99OHZIQYNLsZrWmtq2AoiErOOeTacdowfd3
 nagpFEK8KjRUHY8xboL8xZDTXai0uGoHgufwV50RprcfgWwnzbWWauVAk4B2T8NGRZ3y
 GAAnAFC8yHQSHziJAdyGqFSuaJAZRFBKrmkz0FwB9Iy3vXyKHUjAkAJvdl96mWOmYUEx
 DZFcN8c/OvZfgdPzf96veIdEm9nQAtDW3WmFG+iWgZqi6w77jGhCpPMiLi8x+V8JDVBD
 ZmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P8VKZJgIOfKJQqqxkg2s++QEd40BwnCYRjtS8zyaB9g=;
 b=Abekm+NRcUurf/xyQ+Fc8Q8BFc7FEuAt3xy24gx5NAR/wZiuIXbwm72hZC0S/4MJb3
 5SZcxRBHy2pSbu0ADWfgZoKFGmcjZx3MKupSwUpT9LluySi+Jw+lA3jM4VPr1nO6nCiV
 YvuNUs0jqRm29+kCi4MNwrcxT/QnTLNXwB8L93j5ssDzJHmROZ4EUoAC4lbV9J+YToaP
 hKIfENlZIjq9z0hTRNK0b12AbrEfrec9m5uxAF3EfYfkEP/Qp/HSkxBlGKwo4QLx9x80
 dGUCbyOJ4cqeJJhTDFTuYbXrC27YCByzImCXgneXVv+N4ZPpi4oLN01WaNF6bCcdnKeO
 9WQA==
X-Gm-Message-State: AOAM532kEIlEjJDcuQB8XZJxM/Z6fv3gUtsG51p8MWDRUdWobyyzcUBe
 mDuCmb0GjyGGsHczXCPTQdw=
X-Google-Smtp-Source: ABdhPJwiIVBKjbuMqPuBu145QDDnNyabxNwZ3EBw4jd/qIpOQAicGFWbr0s4AlF9dhzXMLJO+WoYgA==
X-Received: by 2002:ac2:4827:: with SMTP id 7mr2765932lft.493.1601733954070;
 Sat, 03 Oct 2020 07:05:54 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id z2sm1630625lfc.209.2020.10.03.07.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 07:05:53 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To: Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
 joro@8bytes.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <97d69b0b-db32-08ff-0691-73cfa571f974@gmail.com>
Date: Sat, 3 Oct 2020 17:05:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003065947.18671-3-nicoleotsuka@gmail.com>
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

MDMuMTAuMjAyMCAwOTo1OSwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gICAgIHVidW50dUBq
ZXRzb246fiQgZG1lc2cgfCBncmVwIGlvbW11Cj4gICAgIGlvbW11OiBEZWZhdWx0IGRvbWFpbiB0
eXBlOiBUcmFuc2xhdGVkIAo+ICAgICB0ZWdyYS1pMmMgNzAwMGM0MDAuaTJjOiBBZGRpbmcgdG8g
aW9tbXUgZ3JvdXAgMAo+ICAgICB0ZWdyYS1pMmMgNzAwMGM1MDAuaTJjOiBBZGRpbmcgdG8gaW9t
bXUgZ3JvdXAgMAo+ICAgICB0ZWdyYS1pMmMgNzAwMGQwMDAuaTJjOiBBZGRpbmcgdG8gaW9tbXUg
Z3JvdXAgMAo+ICAgICB0ZWdyYS1wY2llIDEwMDMwMDAucGNpZTogQWRkaW5nIHRvIGlvbW11IGdy
b3VwIDEKCkNvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiBob3cgeW91IGdvdCBJMkMgaW50byBJT01N
VT8KCkFyZSB5b3UgdGVzdGluZyB2YW5pbGxhIHVwc3RyZWFtIGtlcm5lPyBVcHN0cmVhbSBEVCBk
b2Vzbid0IGFzc2lnbiBBSEIKZ3JvdXAgdG8gSTJDIGNvbnRyb2xsZXJzLCBub3IgdG8gQVBCIERN
QSBjb250cm9sbGVyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
