Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 225752789FE
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 15:52:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B34B386DBD;
	Fri, 25 Sep 2020 13:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFt53fwSu34b; Fri, 25 Sep 2020 13:52:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08DAA86DBC;
	Fri, 25 Sep 2020 13:52:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC0A6C0051;
	Fri, 25 Sep 2020 13:52:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D83EC0051
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 13:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1C7D386C3E
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 13:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYszweIV1Zbh for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 13:52:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F310586C35
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 13:52:53 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 77so2916728lfj.0
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lVuxNTWKiK7ZzebA+S325g8VsDZU2WkHa9Rw4/y6Yh4=;
 b=pTIzvOQJ8QsKu3mgWbzEEJ3JvOe2YMiNzgtvwsVqRK+mV3ahvoDKYbpJT7+dM8teuu
 7OlanG3JLRYT4r1cr8toZ9gME34gWzYaeiq2BuJMZJa1zg2It+40BhM0QLZEYQnZH15o
 wi3oY4UJLTUOFH88dnU1eKZzuDmll8ulFuNG+F+5D7K9m/MYsLbVusZYDAy/CgyrxOY1
 cgTBxpATSlDm+7r/r3nHGgaZmdyy+QVeOWfyZZhGiY/OB5Z2a1fnjqq1RRTpVMyf0Q4z
 SWaSJO4N5YKvnIEZJRAlp5wImESRxxOWHP5M1RL/CLSluvNJ5DKubuXX7Uiz+CFpj9A4
 2iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lVuxNTWKiK7ZzebA+S325g8VsDZU2WkHa9Rw4/y6Yh4=;
 b=P+aytjDOl2rDhCHt5bzIvDhE5MiRPLRl9LyZu4ogObscujfviDgiVKvqLtAqS8E6K2
 Hu+GyxiVFCn3b6qetVc9T8iP4XPzbuTWY+9tAMV1rLUNPGbKUQU59wAQUmyZEqSwt6hX
 gXUPwTyGzZ06bW8ekEixocHKgb9Ojpbju2xOvUrTws1JCvMzJDD2CkZ0A8nFUswTU8/b
 fq0lolGT0Wl48Q6wTXIMSfV5T4T6gXH1k4fY8bs3swAPCq0JG8WI2wH0izHNXUk0sw1S
 I4Mt+qn0PBnIQIBIqZ2s5SOfTyJwLA/bV5Ux4cJ2javsewz0gzfljAlSexMAv8bn7tw9
 jEkQ==
X-Gm-Message-State: AOAM532FR9psOPFkphnnCWQlYeYn8XWDv9kYlFYEyJc6tbzzTuhe5wg3
 81q90dnk5l2Kc1KtaSsv2MA=
X-Google-Smtp-Source: ABdhPJyDzk4d7CznX8Ks8Mm705Zqxc2zjQZQizPGHHFGmcHoZL/BsmhhRSbIGQIQRkv2RxGZsm0fZA==
X-Received: by 2002:a05:6512:3e8:: with SMTP id
 n8mr1380475lfq.492.1601041971979; 
 Fri, 25 Sep 2020 06:52:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id n18sm2342159lfe.7.2020.09.25.06.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 06:52:51 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
To: Robin Murphy <robin.murphy@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
 <20200924140130.GA2527337@ulmo>
 <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
 <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4f35bf17-a354-6ffb-fd4a-063027d83ccc@gmail.com>
Date: Fri, 25 Sep 2020 16:52:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Will Deacon <will@kernel.org>
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

MjUuMDkuMjAyMCAxNTozOSwgUm9iaW4gTXVycGh5INC/0LjRiNC10YI6Ci4uLgo+PiBZZXMsIG15
IHVuZGVyc3RhbmRpbmcgdGhhdCB0aGlzIGlzIHdoYXQgUm9iaW4gc3VnZ2VzdGVkIGhlcmU6Cj4+
Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlvbW11L2NiMTI4MDhiLTczMTYtMTlk
Yi03NDEzLWI3Zjg1MmE2ZjhhZUBhcm0uY29tLwo+Pgo+IAo+IEp1c3QgdG8gY2xhcmlmeSwgd2hh
dCBJIHdhcyB0YWxraW5nIGFib3V0IHRoZXJlIGlzIGxhcmdlbHkgb3J0aG9nb25hbCB0bwo+IHRo
ZSBpc3N1ZSBoZXJlLiBUaGF0IHdhcyBhYm91dCBzeXN0ZW1zIHdpdGggbGltaXRlZCB0cmFuc2xh
dGlvbgo+IHJlc291cmNlcyBsZXR0aW5nIHRyYW5zbGF0aW9uIGJlIHNwZWNpZmljYWxseSBvcHQt
aW4gYnkgSU9NTVUtYXdhcmUKPiBkcml2ZXJzLiBJdCBwcm9iYWJseSAqd291bGQqIGhhcHBlbiB0
byBvYnZpYXRlIHRoZSBpc3N1ZSBvZiBkaXNydXB0aW5nCj4gbGl2ZSBETUEgYXQgYm9vdCB0aW1l
IG9uIHRoZXNlIHBhcnRpY3VsYXIgVGVncmEgcGxhdGZvcm1zLCBidXQgd2Ugc3RpbGwKPiBuZWVk
IHNvbWV0aGluZyBsaWtlIFRoaWVycnkncyBzb2x1dGlvbiBpbiBnZW5lcmFsLCBzaW5jZSBJT01N
VSBkcml2ZXJzCj4gbWF5IGhhdmUgbm8gb3RoZXIgd2F5IHRvIGRldGVybWluZSB3aGV0aGVyIGRl
dmljZXMgYXJlIGFjdGl2ZSBhdCBib290Cj4gYW5kIHRoZXkgaGF2ZSB0byB0YWtlIGNhcmUgdG8g
YXZvaWQgYnJlYWtpbmcgYW55dGhpbmcgLSBlLmcuIFNNTVV2MyB3aWxsCj4gYXQgYSBiYXJlIG1p
bmltdW0gbmVlZCB0byBzZXQgdXAgKnNvbWUqIGZvcm0gb2YgdmFsaWQgc3RyZWFtIHRhYmxlIGVu
dHJ5Cj4gZm9yIHRoZSByZWxldmFudCBkZXZpY2UocykgcmlnaHQgYXQgdGhlIGJlZ2lubmluZyB3
aGVyZSB3ZSBmaXJzdCBwcm9iZQo+IGFuZCByZXNldCB0aGUgU01NVSBpdHNlbGYsIHJlZ2FyZGxl
c3Mgb2Ygd2hhdCBoYXBwZW5zIHdpdGggZG9tYWlucyBhbmQKPiBhZGRyZXNzZXMgbGF0ZXIgZG93
biB0aGUgbGluZS4KClllcywgSSBvbmx5IG1lYW50IHRoYXQgeW91cnMgc3VnZ2VzdGlvbiBhbHNv
IHNob3VsZCBiZSB1c2VmdWwgaGVyZS4KQW55d2F5cywgdGhhbmsgeW91IGZvciB0aGUgY2xhcmlm
aWNhdGlvbiA6KQoKSSBhZ3JlZSB0aGF0IHRoZSBUaGllcnJ5J3MgcHJvcG9zYWwgaXMgZ29vZCEg
QnV0IGl0IG5lZWRzIHNvbWUgbW9yZQp0aG91Z2h0IHlldCBiZWNhdXNlIGl0J3Mgbm90IHZlcnkg
YXBwbGljYWJsZSB0byB0aGUgY3VycmVudCBkZXZpY2VzLgoKPj4+IFRoZSBwcmltYXJ5IGdvYWwg
aGVyZSBpcyB0byBtb3ZlIHRvd2FyZHMgdXNpbmcgdGhlIERNQSBBUEkgcmF0aGVyIHRoYW4KPj4+
IHRoZSBJT01NVSBBUEkgZGlyZWN0bHksIHNvIHdlIGRvbid0IHJlYWxseSBoYXZlIHRoZSBvcHRp
b24gb2YgcmVwbGFjaW5nCj4+PiB3aXRoIGFuIGV4cGxpY2l0bHkgY3JlYXRlZCBkb21haW4uIFVu
bGVzcyB3ZSBoYXZlIGNvZGUgaW4gdGhlIERNQS9JT01NVQo+Pj4gY29kZSB0aGF0IGRvZXMgdGhp
cyBzb21laG93Lgo+Pj4KPj4+IEJ1dCBJJ20gbm90IHN1cmUgd2hhdCB3b3VsZCBiZSBhIGdvb2Qg
d2F5IHRvIG1hcmsgY2VydGFpbiBkZXZpY2VzIGFzCj4+PiBuZWVkaW5nIGFuIGlkZW50aXR5IGRv
bWFpbiBieSBkZWZhdWx0LiBEbyB3ZSBzdGlsbCB1c2UgdGhlIHJlc2VydmVkLQo+Pj4gbWVtb3J5
IG5vZGUgZm9yIHRoYXQ/Cj4+Cj4+IFRoZSByZXNlcnZlZC1tZW1vcnkgaW5kZWVkIHNob3VsZG4n
dCBiZSBuZWVkZWQgZm9yIHJlc29sdmluZyB0aGUKPj4gaW1wbGljaXQgSU9NTVUgcHJvYmxlbSBz
aW5jZSB3ZSBjb3VsZCBtYXJrIGNlcnRhaW4gZGV2aWNlcyB3aXRoaW4gdGhlCj4+IGtlcm5lbCBJ
T01NVSBkcml2ZXIuCj4+Cj4+IEkgaGF2ZW4ndCBnb3QgYXJvdW5kIHRvIHRyeWluZyB0byBpbXBs
ZW1lbnQgdGhlIGltcGxpY2l0IElPTU1VIHN1cHBvcnQKPj4geWV0LCBidXQgSSBzdXBwb3NlIHdl
IGNvdWxkIGltcGxlbWVudCB0aGUgZGVmX2RvbWFpbl90eXBlKCkgaG9vayBpbiB0aGUKPj4gU01N
VSBkcml2ZXIgYW5kIHRoZW4gcmV0dXJuIElPTU1VX0RPTUFJTl9JREVOVElUWSBmb3IgdGhlIERp
c3BsYXkvVkRFCj4+IGRldmljZXMuIFRoZW4gdGhlIERpc3BsYXkvVkRFIGRyaXZlcnMgd2lsbCB0
YWtlIG92ZXIgdGhlIGlkZW50aXR5IGRvbWFpbgo+PiBhbmQgcmVwbGFjZSBpdCB3aXRoIHRoZSBl
eHBsaWNpdCBkb21haW4uCj4gCj4gRldJVyBJJ3ZlIGFscmVhZHkgY29va2VkIHVwIGlkZW50aXR5
IGRvbWFpbiBzdXBwb3J0IGZvciB0ZWdyYS1nYXJ0OyBJCj4gd2FzIHBsYW5uaW5nIG9uIHRhY2ts
aW5nIGl0IGZvciB0ZWdyYS1zbW11IGFzIHdlbGwgZm9yIHRoZSBuZXh0IHZlcnNpb24KPiBvZiBt
eSBhcm0gZGVmYXVsdCBkb21haW5zIHNlcmllcyAod2hpY2ggd2lsbCBiZSBhZnRlciB0aGUgbmV4
dCAtcmMxIG5vdwo+IHNpbmNlIEknbSBqdXN0IGFib3V0IHRvIHRha2Ugc29tZSBsb25nLW92ZXJk
dWUgaG9saWRheSkuCgpWZXJ5IG5pY2UhIE1heWJlIHdlIHdpbGwgaGF2ZSBzb21lIG1vcmUgZm9v
ZCBmb3IgdGhlIGRpc2N1c3Npb24gYnkgdGhlCnRpbWUgeW91J2xsIHJldHVybi4gSGF2ZSBhIGdv
b2QgdGltZSEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
