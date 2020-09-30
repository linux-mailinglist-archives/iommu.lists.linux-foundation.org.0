Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4B27F490
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 23:56:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 02DDA20445;
	Wed, 30 Sep 2020 21:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cs1ZF4nLXig; Wed, 30 Sep 2020 21:56:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BFB65203C8;
	Wed, 30 Sep 2020 21:56:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72E82C1AD6;
	Wed, 30 Sep 2020 21:56:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A19B3C0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 21:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7F13B203BA
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 21:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6SqdT+IODp0 for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 21:56:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 82A6920345
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 21:56:49 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id b19so2883558lji.11
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 14:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l4v1Rqtf8JVCwJCj2DIQWVh+hszuC1ak27UuWq627Tw=;
 b=TuQ/Jkj6MHCpiYxy2xBdJKJB2aGd4oWNFivqUaMBEVJuCFgOXZOqWY1NmlohAU9OMc
 ohMZNRJ95teLwYIXdEYfCHlzF4kQ798Qm6Jo+kgeYxGK50F21IkBGdyxAbP2/7/gSoAk
 dpC+sWK38lsiC6EUZU1GH/q2dBc0V/7OpmsAKG9EOgVHnGbQW4sIiVtaOb8J9/NcgENF
 wFhJM307doFqLOWoIz9aPDgSgpDKK5lxBYWSSY+2sHn+bPw9iWdAk/4fBNaIEIRGfAfA
 td/pUQ0Xi4XcbbErpqOdC9Ps3H1dXUBGS/q0cTOUC6RL/hhcqyJ0ZdkzFBUIcwq6cU6H
 sZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l4v1Rqtf8JVCwJCj2DIQWVh+hszuC1ak27UuWq627Tw=;
 b=UkXguyhzEaODit89dBFxtPkHkJhIDHqaCX8+0OMHk3EwiBokt4otva2yzR4bhQu3il
 fehxl4JOpb9SHoj36mF/eZUj9VI66UexYCUOaKQAyanVT2w5n9YuhsDc+2TR/7EB/uIw
 BBP6e7FQoYc4YAsyiVuytuyKUAJ84DGu9hOxM5WCsJFrz40c4v6/LchszA3gnyV/K2db
 bfA6ICutkoW0C7mGUwxZR4QNibbhFHZl4qzyPBclUEb1n9VaosUA7KrwuzIwZb+24IG0
 ifEMcVuA+md8O3J6ZFtPwyqKxPKniXnnVeqAchg0/mMOxa0LS0o3r05cWNZ8pcGIw1/n
 UBbg==
X-Gm-Message-State: AOAM5336DhS8IxUkgCdHgSidWly2PTd+ttEsLv/73r4JWdilG2xfJrA7
 vcd49dL2VrJn92A5plnPVqE=
X-Google-Smtp-Source: ABdhPJy71Zq7RRgjGwcTuu/+eYGrfcM5iZCBTgqk/k/1z1F09LrJXac+jA2l2r6FiHiLkyCbegyaNQ==
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr1599589ljm.200.1601503007550; 
 Wed, 30 Sep 2020 14:56:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id t23sm259746ljc.125.2020.09.30.14.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 14:56:47 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo> <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
Date: Thu, 1 Oct 2020 00:56:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930213244.GA10573@Asurada-Nvidia>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 krzk@kernel.org, jonathanh@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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

MDEuMTAuMjAyMCAwMDozMiwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gT24gVGh1LCBPY3Qg
MDEsIDIwMjAgYXQgMTI6MjQ6MjVBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAu
Li4KPj4+PiBJdCBsb29rcyB0byBtZSBsaWtlIHRoZSBvbmx5IHJlYXNvbiB3aHkgeW91IG5lZWQg
dGhpcyBuZXcgZ2xvYmFsIEFQSSBpcwo+Pj4+IGJlY2F1c2UgUENJIGRldmljZXMgbWF5IG5vdCBo
YXZlIGEgZGV2aWNlIHRyZWUgbm9kZSB3aXRoIGEgcGhhbmRsZSB0bwo+Pj4+IHRoZSBJT01NVS4g
SG93ZXZlciwgU01NVSBzdXBwb3J0IGZvciBQQ0kgd2lsbCBvbmx5IGJlIGVuYWJsZWQgaWYgdGhl
Cj4+Pj4gcm9vdCBjb21wbGV4IGhhcyBhbiBpb21tdXMgcHJvcGVydHksIHJpZ2h0PyBJbiB0aGF0
IGNhc2UsIGNhbid0IHdlCj4+Pj4gc2ltcGx5IGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pj4K
Pj4+PiAJaWYgKGRldl9pc19wY2koZGV2KSkKPj4+PiAJCW5wID0gZmluZF9ob3N0X2JyaWRnZShk
ZXYpLT5vZl9ub2RlOwo+Pj4+IAllbHNlCj4+Pj4gCQlucCA9IGRldi0+b2Zfbm9kZTsKPj4+Pgo+
Pj4+ID8gSSdtIG5vdCBzdXJlIGV4YWN0bHkgd2hhdCBmaW5kX2hvc3RfYnJpZGdlKCkgaXMgY2Fs
bGVkLCBidXQgSSdtIHByZXR0eQo+Pj4+IHN1cmUgdGhhdCBleGlzdHMuCj4+Pj4KPj4+PiBPbmNl
IHdlIGhhdmUgdGhhdCB3ZSBjYW4gc3RpbGwgaXRlcmF0ZSBvdmVyIHRoZSBpb21tdXMgcHJvcGVy
dHkgYW5kIGRvCj4+Pj4gbm90IG5lZWQgdG8gcmVseSBvbiB0aGlzIGdsb2JhbCB2YXJpYWJsZS4K
Pj4+Cj4+PiBJIGFncmVlIHRoYXQgaXQnZCB3b3JrLiBCdXQgSSB3YXMgaG9waW5nIHRvIHNpbXBs
aWZ5IHRoZSBjb2RlCj4+PiBoZXJlIGlmIGl0J3MgcG9zc2libGUuIExvb2tzIGxpa2Ugd2UgaGF2
ZSBhbiBhcmd1bWVudCBvbiB0aGlzCj4+PiBzbyBJIHdpbGwgY2hvb3NlIHRvIGdvIHdpdGggeW91
ciBzdWdnZXN0aW9uIGFib3ZlIGZvciBub3cuCj4+Cj4+IFRoaXMgcGF0Y2ggcmVtb3ZlZCBtb3Jl
IGxpbmVzIHRoYW4gd2VyZSBhZGRlZC4gSWYgdGhpcyB3aWxsIGJlIG9wcG9zaXRlCj4+IGZvciB0
aGUgVGhpZXJyeSdzIHN1Z2dlc3Rpb24sIHRoZW4gaXQncyBwcm9iYWJseSBub3QgYSBncmVhdCBz
dWdnZXN0aW9uLgo+IAo+IFNvcnJ5LCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgdGhpcyBjb21t
ZW50cy4gV291bGQgeW91IHBsZWFzZQo+IGVsYWJvcmF0ZSB3aGF0J3MgdGhpcyAiaXQiIGJlaW5n
ICJub3QgYSBncmVhdCBzdWdnZXN0aW9uIj8KPiAKCkkgbWVhbnQgdGhhdCB5b3Ugc2hvdWxkIHRy
eSB0byBpbXBsZW1lbnQgVGhpZXJyeSdzIHNvbHV0aW9uLCBidXQgaWYgdGhlCmVuZCByZXN1bHQg
d2lsbCBiZSB3b3JzZSB0aGFuIHRoZSBjdXJyZW50IHBhdGNoLCB0aGVuIHlvdSBzaG91bGRuJ3Qg
bWFrZQphIHY0LCBidXQgZ2V0IGJhY2sgdG8gdGhpcyBkaXNjdXNzaW9uIGluIG9yZGVyIHRvIGNo
b29zZSB0aGUgYmVzdCBvcHRpb24KYW5kIG1ha2UgZXZlcnlvbmUgYWdyZWUgb24gaXQuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcg
bGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
