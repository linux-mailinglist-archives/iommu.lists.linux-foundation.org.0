Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848827F7B9
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 04:06:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E05A786243;
	Thu,  1 Oct 2020 02:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuY2UqPsoUbf; Thu,  1 Oct 2020 02:06:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F4B38623F;
	Thu,  1 Oct 2020 02:06:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57B18C0051;
	Thu,  1 Oct 2020 02:06:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CAE4C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 02:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8FF6F854E8
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 02:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tv9aEkFBOy7I for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 02:06:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9698784C7E
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 02:06:23 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z17so4557261lfi.12
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 19:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YT6z6SMkQQE3bTl2QkyWGfDYfQH3pmpWjf60JPV3Yng=;
 b=ERo6xhYK/8Csp5aBw8ryB96uxnmJuPMEIptVZqUVjPHJLdD5mgjoUylCs9I5/gD3P7
 nngkKTH8LnORX29oJ1go1C/Gy8R3wF0Swxv7JCZjT8otGdRbGXIR6wdhsoXSmmgyfp9I
 K83cwe9730+1WJl13cRSU+TxZ0vR4+Qw407nAZrFpl3Y4xD9gQuBmtlztO4wbEvFrt+D
 4GUBk71dJTI3BEWFS9nFjfdIcz8KzeHo2+9NVY2Rd4pmmGJ1ZDZBVK6EE4oiWE8Z3uRI
 UtZeLgGlORqRi8N1ESMSy+Q6pF52Fpekxr+sS+uBsd6jyHkuxhHmavos/G/BxyDOzKoI
 VjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YT6z6SMkQQE3bTl2QkyWGfDYfQH3pmpWjf60JPV3Yng=;
 b=THviCOADpkMG0Nm+WhC4jFwGhTaR7wwr5ri8/IE5JYVR9AQ5mQW5qn/dK9QlrjsB/b
 NoooIzaHg4YpaiIL5xLwAPeHcs4bzNbgkTS/NIX9cJx1T8P85B/PK5SHkqkGhT1LnZDJ
 sfk306HanxZMN0nihl4v0Hpr1mAmFMqphm31SPyG6w6HIFOmdDlAiMqjd7lUZ6Is802A
 HOX6e0IPOERWM4CNsa14RA6GjzkfN9WYAn0azgzJfdt5ErqmSfY306M/amGwQGGrUUvf
 kw/CBfJQQUHbtUOV5eAZDK47CuWcXFjFRaES2f3JRZfptWjRBmRusNXwSnpYDhGdhcwH
 oaBQ==
X-Gm-Message-State: AOAM533I7sSFbt0p7JW7pe4L5ZR3wE7CYJbchrbTFrPly1byWADfOr6t
 uj9hAu8JqiZrQiYJnRLxUDo=
X-Google-Smtp-Source: ABdhPJymiGq5V4Psj16FQr1wV5U8s+X6XJ2xhLtp3VlKEAi7EvPV2sW9z6UEKu1kSVjfn4/cBnKjDQ==
X-Received: by 2002:ac2:46fa:: with SMTP id q26mr1633365lfo.155.1601517981523; 
 Wed, 30 Sep 2020 19:06:21 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
 by smtp.googlemail.com with ESMTPSA id u2sm302304ljl.77.2020.09.30.19.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 19:06:20 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo> <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
Date: Thu, 1 Oct 2020 05:06:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001012630.GA28240@Asurada-Nvidia>
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

MDEuMTAuMjAyMCAwNDoyNiwgTmljb2xpbiBDaGVuINC/0LjRiNC10YI6Cj4gT24gVGh1LCBPY3Qg
MDEsIDIwMjAgYXQgMTI6NTY6NDZBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAw
MS4xMC4yMDIwIDAwOjMyLCBOaWNvbGluIENoZW4g0L/QuNGI0LXRgjoKPj4+IE9uIFRodSwgT2N0
IDAxLCAyMDIwIGF0IDEyOjI0OjI1QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+
PiAuLi4KPj4+Pj4+IEl0IGxvb2tzIHRvIG1lIGxpa2UgdGhlIG9ubHkgcmVhc29uIHdoeSB5b3Ug
bmVlZCB0aGlzIG5ldyBnbG9iYWwgQVBJIGlzCj4+Pj4+PiBiZWNhdXNlIFBDSSBkZXZpY2VzIG1h
eSBub3QgaGF2ZSBhIGRldmljZSB0cmVlIG5vZGUgd2l0aCBhIHBoYW5kbGUgdG8KPj4+Pj4+IHRo
ZSBJT01NVS4gSG93ZXZlciwgU01NVSBzdXBwb3J0IGZvciBQQ0kgd2lsbCBvbmx5IGJlIGVuYWJs
ZWQgaWYgdGhlCj4+Pj4+PiByb290IGNvbXBsZXggaGFzIGFuIGlvbW11cyBwcm9wZXJ0eSwgcmln
aHQ/IEluIHRoYXQgY2FzZSwgY2FuJ3Qgd2UKPj4+Pj4+IHNpbXBseSBkbyBzb21ldGhpbmcgbGlr
ZSB0aGlzOgo+Pj4+Pj4KPj4+Pj4+IAlpZiAoZGV2X2lzX3BjaShkZXYpKQo+Pj4+Pj4gCQlucCA9
IGZpbmRfaG9zdF9icmlkZ2UoZGV2KS0+b2Zfbm9kZTsKPj4+Pj4+IAllbHNlCj4+Pj4+PiAJCW5w
ID0gZGV2LT5vZl9ub2RlOwo+Pj4+Pj4KPj4+Pj4+ID8gSSdtIG5vdCBzdXJlIGV4YWN0bHkgd2hh
dCBmaW5kX2hvc3RfYnJpZGdlKCkgaXMgY2FsbGVkLCBidXQgSSdtIHByZXR0eQo+Pj4+Pj4gc3Vy
ZSB0aGF0IGV4aXN0cy4KPj4+Pj4+Cj4+Pj4+PiBPbmNlIHdlIGhhdmUgdGhhdCB3ZSBjYW4gc3Rp
bGwgaXRlcmF0ZSBvdmVyIHRoZSBpb21tdXMgcHJvcGVydHkgYW5kIGRvCj4+Pj4+PiBub3QgbmVl
ZCB0byByZWx5IG9uIHRoaXMgZ2xvYmFsIHZhcmlhYmxlLgo+Pj4+Pgo+Pj4+PiBJIGFncmVlIHRo
YXQgaXQnZCB3b3JrLiBCdXQgSSB3YXMgaG9waW5nIHRvIHNpbXBsaWZ5IHRoZSBjb2RlCj4+Pj4+
IGhlcmUgaWYgaXQncyBwb3NzaWJsZS4gTG9va3MgbGlrZSB3ZSBoYXZlIGFuIGFyZ3VtZW50IG9u
IHRoaXMKPj4+Pj4gc28gSSB3aWxsIGNob29zZSB0byBnbyB3aXRoIHlvdXIgc3VnZ2VzdGlvbiBh
Ym92ZSBmb3Igbm93Lgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCByZW1vdmVkIG1vcmUgbGluZXMgdGhh
biB3ZXJlIGFkZGVkLiBJZiB0aGlzIHdpbGwgYmUgb3Bwb3NpdGUKPj4+PiBmb3IgdGhlIFRoaWVy
cnkncyBzdWdnZXN0aW9uLCB0aGVuIGl0J3MgcHJvYmFibHkgbm90IGEgZ3JlYXQgc3VnZ2VzdGlv
bi4KPj4+Cj4+PiBTb3JyeSwgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoaXMgY29tbWVudHMu
IFdvdWxkIHlvdSBwbGVhc2UKPj4+IGVsYWJvcmF0ZSB3aGF0J3MgdGhpcyAiaXQiIGJlaW5nICJu
b3QgYSBncmVhdCBzdWdnZXN0aW9uIj8KPj4+Cj4+Cj4+IEkgbWVhbnQgdGhhdCB5b3Ugc2hvdWxk
IHRyeSB0byBpbXBsZW1lbnQgVGhpZXJyeSdzIHNvbHV0aW9uLCBidXQgaWYgdGhlCj4+IGVuZCBy
ZXN1bHQgd2lsbCBiZSB3b3JzZSB0aGFuIHRoZSBjdXJyZW50IHBhdGNoLCB0aGVuIHlvdSBzaG91
bGRuJ3QgbWFrZQo+PiBhIHY0LCBidXQgZ2V0IGJhY2sgdG8gdGhpcyBkaXNjdXNzaW9uIGluIG9y
ZGVyIHRvIGNob29zZSB0aGUgYmVzdCBvcHRpb24KPj4gYW5kIG1ha2UgZXZlcnlvbmUgYWdyZWUg
b24gaXQuCj4gCj4gSSBzZWUuIFRoYW5rcyBmb3IgdGhlIHJlcGx5LiBBbmQgaGVyZSBpcyBhIHNh
bXBsZSBpbXBsZW1lbnRhdGlvbjoKClRoYXQncyB3aGF0IEkgc3VwcG9zZWQgdG8gaGFwcGVuIDop
IFRoZSBuZXcgdmFyaWFudCBhZGRzIGNvZGUgYW5kCmNvbXBsZXhpdHksIHdoaWxlIG9sZCBkaWQg
dGhlIG9wcG9zaXRlLiBIZW5jZSB0aGUgb2xkIHZhcmlhbnQgaXMgY2xlYXJseQptb3JlIGF0dHJh
Y3RpdmUsIElNTy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
