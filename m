Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E3281AC1
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 20:20:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8ECA5204CA;
	Fri,  2 Oct 2020 18:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjM-ns4MZKZ6; Fri,  2 Oct 2020 18:20:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C17B9203A0;
	Fri,  2 Oct 2020 18:20:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98E9CC0051;
	Fri,  2 Oct 2020 18:20:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25E7CC0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 18:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 19F3B87398
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 18:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKnKwe+6bQUF for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 18:20:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 13D848738F
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 18:20:47 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y2so2974634lfy.10
 for <iommu@lists.linux-foundation.org>; Fri, 02 Oct 2020 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EJ8SUAQ3Ep8nykC7R4KdWG2ClAiUfrI8OV4YNM+FLtM=;
 b=TsanysFFkQ79U4TBm6nvg9Yo+quujpAx660+ZpuraPKrgpIpPOyjFfDJYatKidtSoB
 dObEpNaYrDN0/JvPfI4hT9ygTLkeq0Xt28Z7neft0jvPXt4jRYOqCabWnxneXblCUYdL
 bTG3UveiRP4GQAtl3x8rQL1/ckevLNq6JTsPT7PVNElPFZbQyzrDlCwxabW9Jm/2P0Sa
 MUKfA//i4fYSG6+MAS4MIxmtqMG1EB+pv+GtIC9wbeXwwQ8jZa2ujDI5QlKAdZdtgunB
 MM8G9hZzlZQ7vX9O5yaciiMf1MXshw2Uq7YpTOKIbvDIgfLRiI1oh6+VzObvARlx6Lbo
 KjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EJ8SUAQ3Ep8nykC7R4KdWG2ClAiUfrI8OV4YNM+FLtM=;
 b=aOplmopqgSiNKFtLkBbD0wgaCxOQC3M0sA+HMtaP7UsnmvyV0xAAKf/b7TjlKrHXal
 AcOVtxPXAENgSqEuBALfoJ6MbCc8o3k5s9ESGKL4QwgncsEv2jnv6aKag20ZfKiiMKWb
 053Uxjq6Qir3djyx2WQ9oKryxM2cwyli3QzTbMxpVJOMKtyHSoAulgSxuWoDkD/Axga8
 baSXoSXVqhPH98eL0W90blbf7soZv4PYcL3Ez3/zDAP2QJOx6Y33/n0c3uJGZ9SO+Xq2
 9uFHXrZ2VAfL/gZsxzzRjExGsYzEZ4tzMSVA6RpK3ta7UZn0kLEEVfp5H6WuwXe5YENj
 YYjQ==
X-Gm-Message-State: AOAM533giED6kXgcPX6FGmgZ8njhGuA0HFlVTdPFJguvw0dtAVMebz93
 jwsorHvJVfCiWFRrDmqLBxk=
X-Google-Smtp-Source: ABdhPJxvQFlVxqSll8ZIGtobg/4XNVi83XCZGq9LKA9AmED3IrYKz0bS/913AI7QKU97HsYs7XJhRw==
X-Received: by 2002:a19:7604:: with SMTP id c4mr1441873lff.132.1601662845192; 
 Fri, 02 Oct 2020 11:20:45 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru.
 [109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id b197sm471451lfd.251.2020.10.02.11.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 11:20:43 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <070a13b2-cde2-ab9e-7ee0-8fb71fb64d5d@gmail.com>
 <20201002180120.GB29706@Asurada-Nvidia>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11aae4e2-6173-bf83-5970-a03f09e31c47@gmail.com>
Date: Fri, 2 Oct 2020 21:20:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002180120.GB29706@Asurada-Nvidia>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

MDIuMTAuMjAyMCAyMTowMSwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gT24gRnJpLCBPY3Qg
MDIsIDIwMjAgYXQgMDU6MjM6MTRQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAw
Mi4xMC4yMDIwIDA5OjA4LCBOaWNvbGluIENoZW4g0L/QuNGI0LXRgjoKPj4+ICBzdGF0aWMgc3Ry
dWN0IGlvbW11X2RldmljZSAqdGVncmFfc21tdV9wcm9iZV9kZXZpY2Uoc3RydWN0IGRldmljZSAq
ZGV2KQo+Pj4gIHsKPj4+IC0Jc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsK
Pj4+IC0Jc3RydWN0IHRlZ3JhX3NtbXUgKnNtbXUgPSBOVUxMOwo+Pj4gLQlzdHJ1Y3Qgb2ZfcGhh
bmRsZV9hcmdzIGFyZ3M7Cj4+PiAtCXVuc2lnbmVkIGludCBpbmRleCA9IDA7Cj4+PiAtCWludCBl
cnI7Cj4+PiAtCj4+PiAtCXdoaWxlIChvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhucCwgImlv
bW11cyIsICIjaW9tbXUtY2VsbHMiLCBpbmRleCwKPj4+IC0JCQkJCSAgJmFyZ3MpID09IDApIHsK
Pj4+IC0JCXNtbXUgPSB0ZWdyYV9zbW11X2ZpbmQoYXJncy5ucCk7Cj4+PiAtCQlpZiAoc21tdSkg
ewo+Pj4gLQkJCWVyciA9IHRlZ3JhX3NtbXVfY29uZmlndXJlKHNtbXUsIGRldiwgJmFyZ3MpOwo+
Pj4gLQkJCW9mX25vZGVfcHV0KGFyZ3MubnApOwo+Pj4gLQo+Pj4gLQkJCWlmIChlcnIgPCAwKQo+
Pj4gLQkJCQlyZXR1cm4gRVJSX1BUUihlcnIpOwo+Pj4gLQo+Pj4gLQkJCS8qCj4+PiAtCQkJICog
T25seSBhIHNpbmdsZSBJT01NVSBtYXN0ZXIgaW50ZXJmYWNlIGlzIGN1cnJlbnRseQo+Pj4gLQkJ
CSAqIHN1cHBvcnRlZCBieSB0aGUgTGludXgga2VybmVsLCBzbyBhYm9ydCBhZnRlciB0aGUKPj4+
IC0JCQkgKiBmaXJzdCBtYXRjaC4KPj4+IC0JCQkgKi8KPj4+IC0JCQlkZXZfaW9tbXVfcHJpdl9z
ZXQoZGV2LCBzbW11KTsKPj4+IC0KPj4+IC0JCQlicmVhazsKPj4+IC0JCX0KPj4+IC0KPj4+IC0J
CW9mX25vZGVfcHV0KGFyZ3MubnApOwo+Pj4gLQkJaW5kZXgrKzsKPj4+IC0JfQo+Pj4gKwlzdHJ1
Y3QgdGVncmFfc21tdSAqc21tdSA9IGRldl9pb21tdV9wcml2X2dldChkZXYpOwo+Pj4gIAo+Pj4g
IAlpZiAoIXNtbXUpCj4+PiAgCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPj4KPj4gVGhlICFz
bW11IGNhbid0IGV2ZXIgYmUgdHJ1ZSBub3csIGlzbid0IGl0PyBUaGVuIHBsZWFzZSByZW1vdmUg
aXQuCj4gCj4gSG93IGNhbiB5b3UgYmUgc28gc3VyZT8gSGF2ZSB5b3UgcmVhZCBteSBjb21taXQg
bWVzc2FnZT8gVGhlIHdob2xlCj4gcG9pbnQgb2YgcmVtb3ZpbmcgdGhlIGhhY2sgaW4gdGVncmFf
c21tdV9wcm9iZSgpIGlzIHRvIHJldHVybiB0aGUKPiBFUlJfUFRSKC1FTk9ERVYpIGhlcmUuIFRo
ZSBidXNfc2V0X2lvbW11KCkgd2lsbCBjYWxsIHRoaXMgZnVuY3Rpb24KPiB3aGVuIG1jLT5zbW11
IGlzIG5vdCBhc3NpZ25lZCBpdCwgYXMgaXQncyBhc3NpZ25lZCBhZnRlciB3ZSByZXR1cm4KPiB0
ZWdyYV9zbW11X3Byb2JlKCkgd2hpbGUgYnVzX3NldF9pb21tdSgpIGlzIHN0aWxsIGluIHRoZSBt
aWRkbGUgb2YKPiB0aGUgdGVncmFfc21tdV9wcm9iZSgpLgo+IAoKTXkgYmFkLCBJIHByb2JhYmx5
IG1pc3NlZCB0aGF0IHdhcyBsb29raW5nIGF0IHRoZSBwcm9iZV9kZXZpY2UoKSwgbG9va3MKZ29v
ZCB0aGVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
b21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
