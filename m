Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4323D27E0CE
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 08:01:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F145E86DF1;
	Wed, 30 Sep 2020 06:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFHnNwzi07AI; Wed, 30 Sep 2020 06:01:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B528186A98;
	Wed, 30 Sep 2020 06:01:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F5B2C1AD6;
	Wed, 30 Sep 2020 06:01:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1EECC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DFC0E86133
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cL9eoRbyFm00 for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 06:01:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DFD66859EA
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:01:12 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y11so673023lfl.5
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 23:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UZRiEJBWDysqXykX7LZJIMVz3EmdkbeX5DELEMvvroE=;
 b=jEL/fBpb5jUlSXs3zKi99e3d538DZXOvDY+2fRaejkHKoNwIsuKc3cyvVXr9Vw4yf7
 vcX964+N4Aibf0zlaYMx1lOUUZ0HSsO+2LlL8Uru3KMtYR1pfzTo5CbUd5IOYBNeTMAF
 JfoUkQOQl5L4MATHkwtBxRzzg6AAnBgL94WcM2N/JoxmgntavMT7RRwq0QsMGlhV8y1V
 HGApcAF8HmrHp1XQ2Q6Z6Uzvi1LogcisN0LOBd60Fbxh08GX44FDvixlO6o03/T+Ri5+
 p+oqU2n+ZzH2o5bWt95tjWGnvuN4ULR2p/5sqXwyPFBnWyDf8F17iAXlk1dCtOroOALl
 dZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UZRiEJBWDysqXykX7LZJIMVz3EmdkbeX5DELEMvvroE=;
 b=nAyKrvXcuZNMi+D27ufnaQCV83D5gnqnWBBxJTf3YUPH09dIZoh+qrQ1mnGpXWHiMW
 rDwGR1SCUJC2G3+Cey1O9+/Bq2SGXxgs3JnQaiPuiA7Vw5k21QVuAcecLV5RuC2X1vBw
 Euw6SDJ9eE7UTCuZpR/arFINULO8IVnEIR2FjyBkPEECgDcsPZgIV9DHYtwCItCaUvGv
 2L1fypXkA51Mr3Gg8HMfcYJT/HftZRKfMx+XqGTdw78B4J6PPxkQx6okqtrZUmcgJcPZ
 tcjeVXuvSjIHA0LQdZ3EtEkggrAS6gzdiN3ilNYwAtqoCtg6qdg50S/akB4Ywsrc5XFF
 Ujvg==
X-Gm-Message-State: AOAM5300VaAp4LXp6HMcnkJMbRztB1St4bUmtXKLtzZaGq+18e6Zz4KD
 8J4dJOErigpYF5BkyN54J2M=
X-Google-Smtp-Source: ABdhPJyLJ0f8T4q/c6ARPYSGllUwWK9lma/QaD6GqKd7zu3KRujUgBTZhdD5fY+D0Zln64L58p4X7g==
X-Received: by 2002:a19:c154:: with SMTP id r81mr303719lff.424.1601445671172; 
 Tue, 29 Sep 2020 23:01:11 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id m19sm57798lji.112.2020.09.29.23.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 23:01:10 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <5a91f07c-bc27-7607-915c-e98a7a0c4b24@gmail.com>
 <20200930053425.GC31821@Asurada-Nvidia>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <84f05ebd-1123-5dfb-94fe-62564a21706f@gmail.com>
Date: Wed, 30 Sep 2020 09:01:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930053425.GC31821@Asurada-Nvidia>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 krzk@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

MzAuMDkuMjAyMCAwODozNCwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gT24gV2VkLCBTZXAg
MzAsIDIwMjAgYXQgMDg6MTA6MzVBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAz
MC4wOS4yMDIwIDAzOjMwLCBOaWNvbGluIENoZW4g0L/QuNGI0LXRgjoKPj4+ICB2b2lkIHRlZ3Jh
X3NtbXVfcmVtb3ZlKHN0cnVjdCB0ZWdyYV9zbW11ICpzbW11KQo+Pj4gIHsKPj4+ICsJYnVzX3Nl
dF9pb21tdSgmcGxhdGZvcm1fYnVzX3R5cGUsIE5VTEwpOwo+Pgo+PiBXaHkgb25seSBwbGF0Zm9y
bV9idXM/IElzIHRoaXMgcmVhbGx5IG5lZWRlZCBhdCBhbGw/Cj4gCj4gSSBzZWUgcWNvbV9pb21t
dS5jIGZpbGUgc2V0IHRvIE5VTEwgaW4gcmVtb3ZlKCksIFByb2JhYmx5IHNob3VsZAo+IGhhdmUg
YWRkZWQgcGNpX2J1c190eXBlIHRvbyB0aG91Z2guCj4gCj4gT3IgYXJlIHlvdSBzdXJlIHRoYXQg
dGhlcmUncyBubyBuZWVkIGF0IGFsbD8KPiAKCkl0IHdhc24ndCBoZXJlIGJlZm9yZSB0aGlzIHBh
dGNoIGFuZCBwbGF0Zm9ybV9idXMgaXMgdW5yZWxhdGVkIHRvIHRoZQp0b3BpYyBvZiB0aGlzIHBh
dGNoLiBCdXQgaXQgcHJvYmFibHkgc2hvdWxkIGJlIHRoZXJlLgoKT24gdGhlIG90aGVyIGhhbmQs
IHRoZSB0ZWdyYV9zbW11X3JlbW92ZSgpIGlzIHVudXNlZCBhbmQgbWF5YmUgaXQgY291bGQKYmUg
YmV0dGVyIHRvIGdldCByaWQgb2YgdGhpcyB1bnVzZWQgZnVuY3Rpb24gYXQgYWxsLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxp
c3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
