Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B7A414686
	for <lists.iommu@lfdr.de>; Wed, 22 Sep 2021 12:34:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0CC240533;
	Wed, 22 Sep 2021 10:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKDbXKa3ANel; Wed, 22 Sep 2021 10:34:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AE37040537;
	Wed, 22 Sep 2021 10:34:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B2B9C000D;
	Wed, 22 Sep 2021 10:34:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8B47C000D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 10:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A98C60B42
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 10:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_j9FB7dfEF1 for <iommu@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 10:34:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FED8607D7
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 10:34:45 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id m21so2151241pgu.13
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G3lBTKL9FoS2GeTPW9J8hEJVFPyRUNCbdl3irWEPhFg=;
 b=VoKr+BxCSzT9CO4ryTvDD3G9wZrHUE0sTtMLZK2Lm+TkGGecOgC3OOiab9jGCY9Kll
 e3Nkk6KOEavdFjpqSE8OwPf42LqGMmpIaMjrJkf5FQ1bm4DCzaHMVjrS50k81Z5PYZvm
 LaQ3W++2hMpMzkR8a6WUIhPyrHKyj2ps2MmD7UAxL5yD/CVQu0BrCvgI9ZCx/6AZ2ero
 ZA58OyFlrguXiqRw6p72MTnEgdUXrgF+j0mJ9KKnzlhlbmg5lM2sj1CZeNsTS1IjKv3i
 HdblFX8nN+LqjFQBrI25lHxMdYEM3heJ/vSWPC9owVlrfu6UaOxGQhHTnyLKg4SRLwvw
 7IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G3lBTKL9FoS2GeTPW9J8hEJVFPyRUNCbdl3irWEPhFg=;
 b=4L4H7ILJxxDmGYWU1i4WYnGyDZ2GIPU2fX4vCPa5n5LMf15A1xU0THQTefSsZMKfIg
 7AOufz1Iyudu6WfpbhPsVO/hPqtkRbyZxtLBOVpWeR94TdygiZT/XnDJ7z0OSdJBXOb2
 Qsoxlhh5TuFJ8PwXgaLqMaUrMAu1E7znIVY/Mu8eGQown2yIuys/xlxZjCT3vdnIz0va
 DXTqQ26EUS/leIeglWxld4BM4AITCVJCZVtWoGy7yHKPENGj6E1lBNeYg3SU8LQ1vPvr
 bsooHsYodQk5YN7NK6tgAge7GTrOrDPPSokiuAB8awijLENaDXmjjhirHDJ8Ik1L/EPi
 eXyg==
X-Gm-Message-State: AOAM532eUqn1FQQQ7iY5y5YShJtj7yTGxhrZZr3kKYOwoNKrY/Jnnr0X
 UPNxQvuHwYsizuUpsI+gHxY=
X-Google-Smtp-Source: ABdhPJw45PYU6V+KljQsJMZub2teNBXuKQfiyKdheHtrHWEuFzCoMIpWH2xXA/VT8gGeHXUNrWQ24A==
X-Received: by 2002:a63:561a:: with SMTP id k26mr32545930pgb.144.1632306884424; 
 Wed, 22 Sep 2021 03:34:44 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 e13sm2007664pfi.210.2021.09.22.03.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 03:34:44 -0700 (PDT)
Subject: Re: [PATCH V5 12/12] net: netvsc: Add Isolation VM support for netvsc
 driver
To: Christoph Hellwig <hch@lst.de>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
 <20210914133916.1440931-13-ltykernel@gmail.com>
 <MWHPR21MB15939A5D74CA1DF25EE816ADD7DB9@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <43e22b84-7273-4099-42ea-54b06f398650@gmail.com>
Date: Wed, 22 Sep 2021 18:34:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB15939A5D74CA1DF25EE816ADD7DB9@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Language: en-US
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>, KY Srinivasan <kys@microsoft.com>,
 "will@kernel.org" <will@kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "x86@kernel.org" <x86@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "hch@lst.de" <hch@lst.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "pgonda@google.com" <pgonda@google.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "jgross@suse.com" <jgross@suse.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "tj@kernel.org" <tj@kernel.org>, vkuznets <vkuznets@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGkgQ2hyaXN0b3BoOgogICAgIFRoaXMgcGF0Y2ggZm9sbG93cyB5b3VyIHB1cnBvc2FsIGluIHRo
ZSBwcmV2aW91cyBkaXNjdXNzaW9uLgpDb3VsZCB5b3UgaGF2ZSBhIGxvb2s/CiAgICAgInVzZSB2
bWFwX3BmbiBhcyBpbiB0aGUgY3VycmVudCBzZXJpZXMuICBCdXQgaW4gdGhhdCBjYXNlIEkgdGhp
bmsKICAgICB3ZSBzaG91bGQgZ2V0IHJpZCBvZiB0aGUgb3RoZXIgbWFwcGluZyBjcmVhdGVkIGJ5
IHZtYWxsb2MuICBJCiAgICAgdGhvdWdoIGEgYml0IGFib3V0IGZpbmRpbmcgYSB3YXkgdG8gYXBw
bHkgdGhlIG9mZnNldCBpbiB2bWFsbG9jCiAgICAgaXRzZWxmLCBidXQgSSB0aGluayBpdCB3b3Vs
ZCBiZSB0b28gaW52YXNpdmUgdG8gdGhlIG5vcm1hbCBmYXN0CiAgICAgcGF0aC4gIFNvIHRoZSBv
dGhlciBzdWItb3B0aW9uIHdvdWxkIGJlIHRvIGFsbG9jYXRlIHRoZSBwYWdlcwogICAgIG1hbnVh
bGx5IChtYXliZSBldmVuIHVzaW5nIGhpZ2ggb3JkZXIgYWxsb2NhdGlvbnMgdG8gcmVkdWNlIFRM
QgogICAgIHByZXNzdXJlKSBhbmQgdGhlbiByZW1hcCB0aGVtKGh0dHBzOi8vbGttbC5vcmcvbGtt
bC8yMDIxLzkvMi8xMTIpCgpPdGhlcndpc2UsIEkgbWVyZ2UgeW91ciBwcmV2aW91cyBjaGFuZ2Ug
Zm9yIHN3aW90bGIgaW50byBwYXRjaCA5CuKAnHg4Ni9Td2lvdGxiOiBBZGQgU3dpb3RsYiBib3Vu
Y2UgYnVmZmVyIHJlbWFwIGZ1bmN0aW9uIGZvciBIViBJVk3igJ0KWW91IHByZXZpb3VzIGNoYW5n
ZSAKbGluay4oaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdC9jb21t
aXQvODI0OGYyOTU5MjhhZGVkMzM2NGExZTU0YTRlMDAyMmU5M2QzNjEwYykgClBsZWFzZSBoYXZl
IGEgbG9vay4KCgpUaGFua3MuCgoKT24gOS8xNi8yMDIxIDEyOjIxIEFNLCBNaWNoYWVsIEtlbGxl
eSB3cm90ZToKPiBGcm9tOiBUaWFueXUgTGFuIDxsdHlrZXJuZWxAZ21haWwuY29tPiAgU2VudDog
VHVlc2RheSwgU2VwdGVtYmVyIDE0LCAyMDIxIDY6MzkgQU0KPj4KPj4gSW4gSXNvbGF0aW9uIFZN
LCBhbGwgc2hhcmVkIG1lbW9yeSB3aXRoIGhvc3QgbmVlZHMgdG8gbWFyayB2aXNpYmxlCj4+IHRv
IGhvc3QgdmlhIGh2Y2FsbC4gdm1idXNfZXN0YWJsaXNoX2dwYWRsKCkgaGFzIGFscmVhZHkgZG9u
ZSBpdCBmb3IKPj4gbmV0dnNjIHJ4L3R4IHJpbmcgYnVmZmVyLiBUaGUgcGFnZSBidWZmZXIgdXNl
ZCBieSB2bWJ1c19zZW5kcGFja2V0Xwo+PiBwYWdlYnVmZmVyKCkgc3RpbGxzIG5lZWQgdG8gYmUg
aGFuZGxlZC4gVXNlIERNQSBBUEkgdG8gbWFwL3VtYXAKPj4gdGhlc2UgbWVtb3J5IGR1cmluZyBz
ZW5kaW5nL3JlY2VpdmluZyBwYWNrZXQgYW5kIEh5cGVyLVYgc3dpb3RsYgo+PiBib3VuY2UgYnVm
ZmVyIGRtYSBhZGRyZXNzIHdpbGwgYmUgcmV0dXJuZWQuIFRoZSBzd2lvdGxiIGJvdW5jZSBidWZm
ZXIKPj4gaGFzIGJlZW4gbWFza2VkIHRvIGJlIHZpc2libGUgdG8gaG9zdCBkdXJpbmcgYm9vdCB1
cC4KPj4KPj4gQWxsb2NhdGUgcngvdHggcmluZyBidWZmZXIgdmlhIGFsbG9jX3BhZ2VzKCkgaW4g
SXNvbGF0aW9uIFZNIGFuZCBtYXAKPj4gdGhlc2UgcGFnZXMgdmlhIHZtYXAoKS4gQWZ0ZXIgY2Fs
bGluZyB2bWJ1c19lc3RhYmxpc2hfZ3BhZGwoKSB3aGljaAo+PiBtYXJrcyB0aGVzZSBwYWdlcyB2
aXNpYmxlIHRvIGhvc3QsIHVubWFwIHRoZXNlIHBhZ2VzIHRvIHJlbGVhc2UgdGhlCj4+IHZpcnR1
YWwgYWRkcmVzcyBtYXBwZWQgd2l0aCBwaHlzaWNhbCBhZGRyZXNzIGJlbG93IHNoYXJlZF9ncGFf
Ym91bmRhcnkKPj4gYW5kIG1hcCB0aGVtIGluIHRoZSBleHRyYSBhZGRyZXNzIHNwYWNlIHZpYSB2
bWFwX3BmbigpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUaWFueXUgTGFuIDxUaWFueXUuTGFuQG1p
Y3Jvc29mdC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2Ugc2luY2UgdjQ6Cj4+IAkqIEFsbG9jYXRlIHJ4
L3R4IHJpbmcgYnVmZmVyIHZpYSBhbGxvY19wYWdlcygpIGluIElzb2xhdGlvbiBWTQo+PiAJKiBN
YXAgcGFnZXMgYWZ0ZXIgY2FsbGluZyB2bWJ1c19lc3RhYmxpc2hfZ3BhZGwoKS4KPj4gCSogc2V0
IGRtYV9zZXRfbWluX2FsaWduX21hc2sgZm9yIG5ldHZzYyBkcml2ZXIuCj4+Cj4+IENoYW5nZSBz
aW5jZSB2MzoKPj4gCSogQWRkIGNvbW1lbnQgdG8gZXhwbGFpbiB3aHkgbm90IHRvIHVzZSBkbWFf
bWFwX3NnKCkKPj4gCSogRml4IHNvbWUgZXJyb3IgaGFuZGxlLgo+PiAtLS0KPj4gICBkcml2ZXJz
L25ldC9oeXBlcnYvaHlwZXJ2X25ldC5oICAgfCAgIDcgKwo+PiAgIGRyaXZlcnMvbmV0L2h5cGVy
di9uZXR2c2MuYyAgICAgICB8IDI4NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4g
ICBkcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Rydi5jICAgfCAgIDEgKwo+PiAgIGRyaXZlcnMv
bmV0L2h5cGVydi9ybmRpc19maWx0ZXIuYyB8ICAgMiArCj4+ICAgaW5jbHVkZS9saW51eC9oeXBl
cnYuaCAgICAgICAgICAgIHwgICA1ICsKPj4gICA1IGZpbGVzIGNoYW5nZWQsIDI5NiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvaHlw
ZXJ2L2h5cGVydl9uZXQuaCBiL2RyaXZlcnMvbmV0L2h5cGVydi9oeXBlcnZfbmV0LmgKPj4gaW5k
ZXggMzE1Mjc4YTdjZjg4Li44N2U4Yzc0Mzk4YTUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0
L2h5cGVydi9oeXBlcnZfbmV0LmgKPj4gKysrIGIvZHJpdmVycy9uZXQvaHlwZXJ2L2h5cGVydl9u
ZXQuaAo+PiBAQCAtMTY0LDYgKzE2NCw3IEBAIHN0cnVjdCBodl9uZXR2c2NfcGFja2V0IHsKPj4g
ICAJdTMyIHRvdGFsX2J5dGVzOwo+PiAgIAl1MzIgc2VuZF9idWZfaW5kZXg7Cj4+ICAgCXUzMiB0
b3RhbF9kYXRhX2J1ZmxlbjsKPj4gKwlzdHJ1Y3QgaHZfZG1hX3JhbmdlICpkbWFfcmFuZ2U7Cj4+
ICAgfTsKPj4KPj4gICAjZGVmaW5lIE5FVFZTQ19IQVNIX0tFWUxFTiA0MAo+PiBAQCAtMTA3NCw2
ICsxMDc1LDggQEAgc3RydWN0IG5ldHZzY19kZXZpY2Ugewo+Pgo+PiAgIAkvKiBSZWNlaXZlIGJ1
ZmZlciBhbGxvY2F0ZWQgYnkgdXMgYnV0IG1hbmFnZXMgYnkgTmV0VlNQICovCj4+ICAgCXZvaWQg
KnJlY3ZfYnVmOwo+PiArCXN0cnVjdCBwYWdlICoqcmVjdl9wYWdlczsKPj4gKwl1MzIgcmVjdl9w
YWdlX2NvdW50Owo+PiAgIAl1MzIgcmVjdl9idWZfc2l6ZTsgLyogYWxsb2NhdGVkIGJ5dGVzICov
Cj4+ICAgCXN0cnVjdCB2bWJ1c19ncGFkbCByZWN2X2J1Zl9ncGFkbF9oYW5kbGU7Cj4+ICAgCXUz
MiByZWN2X3NlY3Rpb25fY250Owo+PiBAQCAtMTA4Miw2ICsxMDg1LDggQEAgc3RydWN0IG5ldHZz
Y19kZXZpY2Ugewo+Pgo+PiAgIAkvKiBTZW5kIGJ1ZmZlciBhbGxvY2F0ZWQgYnkgdXMgKi8KPj4g
ICAJdm9pZCAqc2VuZF9idWY7Cj4+ICsJc3RydWN0IHBhZ2UgKipzZW5kX3BhZ2VzOwo+PiArCXUz
MiBzZW5kX3BhZ2VfY291bnQ7Cj4+ICAgCXUzMiBzZW5kX2J1Zl9zaXplOwo+PiAgIAlzdHJ1Y3Qg
dm1idXNfZ3BhZGwgc2VuZF9idWZfZ3BhZGxfaGFuZGxlOwo+PiAgIAl1MzIgc2VuZF9zZWN0aW9u
X2NudDsKPj4gQEAgLTE3MzEsNCArMTczNiw2IEBAIHN0cnVjdCBybmRpc19tZXNzYWdlIHsKPj4g
ICAjZGVmaW5lIFJFVFJZX1VTX0hJCTEwMDAwCj4+ICAgI2RlZmluZSBSRVRSWV9NQVgJMjAwMAkv
KiA+MTAgc2VjICovCj4+Cj4+ICt2b2lkIG5ldHZzY19kbWFfdW5tYXAoc3RydWN0IGh2X2Rldmlj
ZSAqaHZfZGV2LAo+PiArCQkgICAgICBzdHJ1Y3QgaHZfbmV0dnNjX3BhY2tldCAqcGFja2V0KTsK
Pj4gICAjZW5kaWYgLyogX0hZUEVSVl9ORVRfSCAqLwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvaHlwZXJ2L25ldHZzYy5jIGIvZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzYy5jCj4+IGluZGV4
IDFmODdlNTcwZWQyYi4uN2Q1MjU0YmYwNDNlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9o
eXBlcnYvbmV0dnNjLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzYy5jCj4+IEBA
IC0yMCw2ICsyMCw3IEBACj4+ICAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPj4gICAjaW5j
bHVkZSA8bGludXgvcnRuZXRsaW5rLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L3ByZWZldGNoLmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgvZ2ZwLmg+Cj4+Cj4+ICAgI2luY2x1ZGUgPGFzbS9zeW5jX2Jp
dG9wcy5oPgo+PiAgICNpbmNsdWRlIDxhc20vbXNoeXBlcnYuaD4KPj4gQEAgLTE1MCwxMSArMTUx
LDMzIEBAIHN0YXRpYyB2b2lkIGZyZWVfbmV0dnNjX2RldmljZShzdHJ1Y3QgcmN1X2hlYWQgKmhl
YWQpCj4+ICAgewo+PiAgIAlzdHJ1Y3QgbmV0dnNjX2RldmljZSAqbnZkZXYKPj4gICAJCT0gY29u
dGFpbmVyX29mKGhlYWQsIHN0cnVjdCBuZXR2c2NfZGV2aWNlLCByY3UpOwo+PiArCXVuc2lnbmVk
IGludCBhbGxvY191bml0Owo+PiAgIAlpbnQgaTsKPj4KPj4gICAJa2ZyZWUobnZkZXYtPmV4dGVu
c2lvbik7Cj4+IC0JdmZyZWUobnZkZXYtPnJlY3ZfYnVmKTsKPj4gLQl2ZnJlZShudmRldi0+c2Vu
ZF9idWYpOwo+PiArCj4+ICsJaWYgKG52ZGV2LT5yZWN2X3BhZ2VzKSB7Cj4+ICsJCWFsbG9jX3Vu
aXQgPSAobnZkZXYtPnJlY3ZfYnVmX3NpemUgLwo+PiArCQkJbnZkZXYtPnJlY3ZfcGFnZV9jb3Vu
dCkgPj4gUEFHRV9TSElGVDsKPj4gKwo+PiArCQl2dW5tYXAobnZkZXYtPnJlY3ZfYnVmKTsKPj4g
KwkJZm9yIChpID0gMDsgaSA8IG52ZGV2LT5yZWN2X3BhZ2VfY291bnQ7IGkrKykKPj4gKwkJCV9f
ZnJlZV9wYWdlcyhudmRldi0+cmVjdl9wYWdlc1tpXSwgYWxsb2NfdW5pdCk7Cj4+ICsJfSBlbHNl
IHsKPj4gKwkJdmZyZWUobnZkZXYtPnJlY3ZfYnVmKTsKPj4gKwl9Cj4+ICsKPj4gKwlpZiAobnZk
ZXYtPnNlbmRfcGFnZXMpIHsKPj4gKwkJYWxsb2NfdW5pdCA9IChudmRldi0+c2VuZF9idWZfc2l6
ZSAvCj4+ICsJCQludmRldi0+c2VuZF9wYWdlX2NvdW50KSA+PiBQQUdFX1NISUZUOwo+PiArCj4+
ICsJCXZ1bm1hcChudmRldi0+c2VuZF9idWYpOwo+PiArCQlmb3IgKGkgPSAwOyBpIDwgbnZkZXYt
PnNlbmRfcGFnZV9jb3VudDsgaSsrKQo+PiArCQkJX19mcmVlX3BhZ2VzKG52ZGV2LT5zZW5kX3Bh
Z2VzW2ldLCBhbGxvY191bml0KTsKPj4gKwl9IGVsc2Ugewo+PiArCQl2ZnJlZShudmRldi0+c2Vu
ZF9idWYpOwo+PiArCX0KPj4gKwo+PiAgIAlrZnJlZShudmRldi0+c2VuZF9zZWN0aW9uX21hcCk7
Cj4+Cj4+ICAgCWZvciAoaSA9IDA7IGkgPCBWUlNTX0NIQU5ORUxfTUFYOyBpKyspIHsKPj4gQEAg
LTMzMCw2ICszNTMsMTA4IEBAIGludCBuZXR2c2NfYWxsb2NfcmVjdl9jb21wX3Jpbmcoc3RydWN0
IG5ldHZzY19kZXZpY2UgKm5ldF9kZXZpY2UsIHUzMiBxX2lkeCkKPj4gICAJcmV0dXJuIG52Y2hh
bi0+bXJjLnNsb3RzID8gMCA6IC1FTk9NRU07Cj4+ICAgfQo+Pgo+PiArdm9pZCAqbmV0dnNjX2Fs
bG9jX3BhZ2VzKHN0cnVjdCBwYWdlICoqKnBhZ2VzX2FycmF5LCB1bnNpZ25lZCBpbnQgKmFycmF5
X2xlbiwKPj4gKwkJCSB1bnNpZ25lZCBsb25nIHNpemUpCj4+ICt7Cj4+ICsJc3RydWN0IHBhZ2Ug
KnBhZ2UsICoqcGFnZXMsICoqdm1hcF9wYWdlczsKPj4gKwl1bnNpZ25lZCBsb25nIHBnX2NvdW50
ID0gc2l6ZSA+PiBQQUdFX1NISUZUOwo+PiArCWludCBhbGxvY191bml0ID0gTUFYX09SREVSX05S
X1BBR0VTOwo+PiArCWludCBpLCBqLCB2bWFwX3BhZ2VfaW5kZXggPSAwOwo+PiArCXZvaWQgKnZh
ZGRyOwo+PiArCj4+ICsJaWYgKHBnX2NvdW50IDwgYWxsb2NfdW5pdCkKPj4gKwkJYWxsb2NfdW5p
dCA9IDE7Cj4+ICsKPj4gKwkvKiB2bWFwKCkgYWNjZXB0cyBwYWdlIGFycmF5IHdpdGggUEFHRV9T
SVpFIGFzIHVuaXQgd2hpbGUgdHJ5IHRvCj4+ICsJICogYWxsb2NhdGUgaGlnaCBvcmRlciBwYWdl
cyBoZXJlIGluIG9yZGVyIHRvIHNhdmUgcGFnZSBhcnJheSBzcGFjZS4KPj4gKwkgKiB2bWFwX3Bh
Z2VzW10gaXMgdXNlZCBhcyBpbnB1dCBwYXJhbWV0ZXIgb2Ygdm1hcCgpLiBwYWdlc1tdIGlzIHRv
Cj4+ICsJICogc3RvcmUgYWxsb2NhdGVkIHBhZ2VzIGFuZCBtYXAgdGhlbSBsYXRlci4KPj4gKwkg
Ki8KPj4gKwl2bWFwX3BhZ2VzID0ga21hbGxvY19hcnJheShwZ19jb3VudCwgc2l6ZW9mKCp2bWFw
X3BhZ2VzKSwgR0ZQX0tFUk5FTCk7Cj4+ICsJaWYgKCF2bWFwX3BhZ2VzKQo+PiArCQlyZXR1cm4g
TlVMTDsKPj4gKwo+PiArcmV0cnk6Cj4+ICsJKmFycmF5X2xlbiA9IHBnX2NvdW50IC8gYWxsb2Nf
dW5pdDsKPj4gKwlwYWdlcyA9IGttYWxsb2NfYXJyYXkoKmFycmF5X2xlbiwgc2l6ZW9mKCpwYWdl
cyksIEdGUF9LRVJORUwpOwo+PiArCWlmICghcGFnZXMpCj4+ICsJCWdvdG8gY2xlYW51cDsKPj4g
Kwo+PiArCWZvciAoaSA9IDA7IGkgPCAqYXJyYXlfbGVuOyBpKyspIHsKPj4gKwkJcGFnZSA9IGFs
bG9jX3BhZ2VzKEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPLAo+PiArCQkJCSAgIGdldF9vcmRlcihh
bGxvY191bml0IDw8IFBBR0VfU0hJRlQpKTsKPj4gKwkJaWYgKCFwYWdlKSB7Cj4+ICsJCQkvKiBU
cnkgYWxsb2NhdGluZyBzbWFsbCBwYWdlcyBpZiBoaWdoIG9yZGVyIHBhZ2VzIGFyZSBub3QgYXZh
aWxhYmxlLiAqLwo+PiArCQkJaWYgKGFsbG9jX3VuaXQgPT0gMSkgewo+PiArCQkJCWdvdG8gY2xl
YW51cDsKPj4gKwkJCX0gZWxzZSB7Cj4gCj4gVGhlICJlbHNlIiBjbGF1c2UgaXNuJ3QgcmVhbGx5
IG5lZWRlZCBiZWNhdXNlIG9mIHRoZSBnb3RvIGNsZWFudXAgYWJvdmUuICBUaGVuCj4gdGhlIGlu
ZGVudGF0aW9uIG9mIHRoZSBjb2RlIGJlbG93IGNvdWxkIGJlIHJlZHVjZWQgYnkgb25lIGxldmVs
Lgo+IAo+PiArCQkJCW1lbXNldCh2bWFwX3BhZ2VzLCAwLAo+PiArCQkJCSAgICAgICBzaXplb2Yo
KnZtYXBfcGFnZXMpICogdm1hcF9wYWdlX2luZGV4KTsKPj4gKwkJCQl2bWFwX3BhZ2VfaW5kZXgg
PSAwOwo+PiArCj4+ICsJCQkJZm9yIChqID0gMDsgaiA8IGk7IGorKykKPj4gKwkJCQkJX19mcmVl
X3BhZ2VzKHBhZ2VzW2pdLCBhbGxvY191bml0KTsKPj4gKwo+PiArCQkJCWtmcmVlKHBhZ2VzKTsK
Pj4gKwkJCQlhbGxvY191bml0ID0gMTsKPiAKPiBUaGlzIGlzIHRoZSBjYXNlIHdoZXJlIGEgbGFy
Z2UgZW5vdWdoIGNvbnRpZ3VvdXMgcGh5c2ljYWwgbWVtb3J5IGNodW5rIGNvdWxkCj4gbm90IGJl
IGZvdW5kLiAgQnV0IHJhdGhlciB0aGFuIGRyb3BwaW5nIGFsbCB0aGUgd2F5IGRvd24gdG8gc2lu
Z2xlIHBhZ2VzLAo+IHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gdHJ5IHNvbWV0aGluZyBzbWFsbGVy
LCBidXQgbm90IDE/ICBGb3IgZXhhbXBsZSwKPiBjdXQgdGhlIGFsbG9jX3VuaXQgaW4gaGFsZiBh
bmQgdHJ5IGFnYWluLiAgQnV0IEknbSBub3Qgc3VyZSBvZiBhbGwgdGhlIGltcGxpY2F0aW9ucy4K
PiAKPj4gKwkJCQlnb3RvIHJldHJ5Owo+PiArCQkJfQo+PiArCQl9Cj4+ICsKPj4gKwkJcGFnZXNb
aV0gPSBwYWdlOwo+PiArCQlmb3IgKGogPSAwOyBqIDwgYWxsb2NfdW5pdDsgaisrKQo+PiArCQkJ
dm1hcF9wYWdlc1t2bWFwX3BhZ2VfaW5kZXgrK10gPSBwYWdlKys7Cj4+ICsJfQo+PiArCj4+ICsJ
dmFkZHIgPSB2bWFwKHZtYXBfcGFnZXMsIHZtYXBfcGFnZV9pbmRleCwgVk1fTUFQLCBQQUdFX0tF
Uk5FTCk7Cj4+ICsJa2ZyZWUodm1hcF9wYWdlcyk7Cj4+ICsKPj4gKwkqcGFnZXNfYXJyYXkgPSBw
YWdlczsKPj4gKwlyZXR1cm4gdmFkZHI7Cj4+ICsKPj4gK2NsZWFudXA6Cj4+ICsJZm9yIChqID0g
MDsgaiA8IGk7IGorKykKPj4gKwkJX19mcmVlX3BhZ2VzKHBhZ2VzW2ldLCBhbGxvY191bml0KTsK
Pj4gKwo+PiArCWtmcmVlKHBhZ2VzKTsKPj4gKwlrZnJlZSh2bWFwX3BhZ2VzKTsKPj4gKwlyZXR1
cm4gTlVMTDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZvaWQgKm5ldHZzY19tYXBfcGFnZXMoc3Ry
dWN0IHBhZ2UgKipwYWdlcywgaW50IGNvdW50LCBpbnQgYWxsb2NfdW5pdCkKPj4gK3sKPj4gKwlp
bnQgcGdfY291bnQgPSBjb3VudCAqIGFsbG9jX3VuaXQ7Cj4+ICsJc3RydWN0IHBhZ2UgKnBhZ2U7
Cj4+ICsJdW5zaWduZWQgbG9uZyAqcGZuczsKPj4gKwlpbnQgcGZuX2luZGV4ID0gMDsKPj4gKwl2
b2lkICp2YWRkcjsKPj4gKwlpbnQgaSwgajsKPj4gKwo+PiArCWlmICghcGFnZXMpCj4+ICsJCXJl
dHVybiBOVUxMOwo+PiArCj4+ICsJcGZucyA9IGtjYWxsb2MocGdfY291bnQsIHNpemVvZigqcGZu
cyksIEdGUF9LRVJORUwpOwo+PiArCWlmICghcGZucykKPj4gKwkJcmV0dXJuIE5VTEw7Cj4+ICsK
Pj4gKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgewo+PiArCQlwYWdlID0gcGFnZXNbaV07
Cj4+ICsJCWlmICghcGFnZSkgewo+PiArCQkJcHJfd2FybigicGFnZSBpcyBub3QgYXZhaWxhYmxl
ICVkLlxuIiwgaSk7Cj4+ICsJCQlyZXR1cm4gTlVMTDsKPj4gKwkJfQo+PiArCj4+ICsJCWZvciAo
aiA9IDA7IGogPCBhbGxvY191bml0OyBqKyspIHsKPj4gKwkJCXBmbnNbcGZuX2luZGV4KytdID0g
cGFnZV90b19wZm4ocGFnZSsrKSArCj4+ICsJCQkJKG1zX2h5cGVydi5zaGFyZWRfZ3BhX2JvdW5k
YXJ5ID4+IFBBR0VfU0hJRlQpOwo+PiArCQl9Cj4+ICsJfQo+PiArCj4+ICsJdmFkZHIgPSB2bWFw
X3BmbihwZm5zLCBwZ19jb3VudCwgUEFHRV9LRVJORUxfSU8pOwo+PiArCWtmcmVlKHBmbnMpOwo+
PiArCXJldHVybiB2YWRkcjsKPj4gK30KPj4gKwo+IAo+IEkgdGhpbmsgeW91IGFyZSBwcm9wb3Np
bmcgdGhpcyBhcHByb2FjaCB0byBhbGxvY2F0aW5nIG1lbW9yeSBmb3IgdGhlIHNlbmQKPiBhbmQg
cmVjZWl2ZSBidWZmZXJzIHNvIHRoYXQgeW91IGNhbiBhdm9pZCBoYXZpbmcgdHdvIHZpcnR1YWwg
bWFwcGluZ3MgZm9yCj4gdGhlIG1lbW9yeSwgcGVyIGNvbW1lbnRzIGZyb20gQ2hyaXN0b3AgSGVs
bHdpZy4gIEJ1dCBvdmVyYWxsLCB0aGUgYXBwcm9hY2gKPiBzZWVtcyBhIGJpdCBjb21wbGV4IGFu
ZCBJIHdvbmRlciBpZiBpdCBpcyB3b3J0aCBpdC4gIElmIGFsbG9jYXRpbmcgbGFyZ2UgY29udGln
dW91cwo+IGNodW5rcyBvZiBwaHlzaWNhbCBtZW1vcnkgaXMgc3VjY2Vzc2Z1bCwgdGhlbiB0aGVy
ZSBpcyBzb21lIG1lbW9yeSBzYXZpbmdzCj4gaW4gdGhhdCB0aGUgZGF0YSBzdHJ1Y3R1cmVzIG5l
ZWRlZCB0byBrZWVwIHRyYWNrIG9mIHRoZSBwaHlzaWNhbCBwYWdlcyBpcwo+IHNtYWxsZXIgdGhh
biB0aGUgZXF1aXZhbGVudCBwYWdlIHRhYmxlcyBtaWdodCBiZS4gIEJ1dCBpZiB5b3UgaGF2ZSB0
byByZXZlcnQKPiB0byBhbGxvY2F0aW5nIGluZGl2aWR1YWwgcGFnZXMsIHRoZW4gdGhlIG1lbW9y
eSBzYXZpbmdzIGlzIHJlZHVjZWQuCj4gCj4gVWx0aW1hdGVseSwgdGhlIGxpc3Qgb2YgYWN0dWFs
IFBGTnMgaGFzIHRvIGJlIGtlcHQgc29tZXdoZXJlLiAgQW5vdGhlciBhcHByb2FjaAo+IHdvdWxk
IGJlIHRvIGRvIHRoZSByZXZlcnNlIG9mIHdoYXQgaHZfbWFwX21lbW9yeSgpIGZyb20gdGhlIHY0
IHBhdGNoCj4gc2VyaWVzIGRvZXMuICBJLmUuLCB5b3UgY291bGQgZG8gdmlydF90b19waHlzKCkg
b24gZWFjaCB2aXJ0dWFsIGFkZHJlc3MgdGhhdAo+IG1hcHMgYWJvdmUgVlRPTSwgYW5kIHN1YnRy
YWN0IG91dCB0aGUgc2hhcmVkX2dwYV9ib3VuZGFyeSB0byBnZXQgdGhlCj4gbGlzdCBvZiBhY3R1
YWwgUEZOcyB0aGF0IG5lZWQgdG8gYmUgZnJlZWQuICAgVGhpcyB3YXkgeW91IGRvbid0IGhhdmUg
dHdvIGNvcGllcwo+IG9mIHRoZSBsaXN0IG9mIFBGTnMgLS0gb25lIHdpdGggYW5kIG9uZSB3aXRo
b3V0IHRoZSBzaGFyZWRfZ3BhX2JvdW5kYXJ5IGFkZGVkLgo+IEJ1dCBpdCBjb21lcyBhdCB0aGUg
Y29zdCBvZiBhZGRpdGlvbmFsIGNvZGUgc28gdGhhdCBtYXkgbm90IGJlIGEgZ3JlYXQgaWRlYS4K
PiAKPiBJIHRoaW5rIHdoYXQgeW91IGhhdmUgaGVyZSB3b3JrcywgYW5kIEkgZG9uJ3QgaGF2ZSBh
IGNsZWFybHkgYmV0dGVyIHNvbHV0aW9uCj4gYXQgdGhlIG1vbWVudCBleGNlcHQgcGVyaGFwcyB0
byByZXZlcnQgdG8gdGhlIHY0IHNvbHV0aW9uIGFuZCBqdXN0IGhhdmUgdHdvCj4gdmlydHVhbCBt
YXBwaW5ncy4gIEknbGwga2VlcCB0aGlua2luZyBhYm91dCBpdC4gIE1heWJlIENocmlzdG9wIGhh
cyBvdGhlcgo+IHRob3VnaHRzLgo+IAo+PiAgIHN0YXRpYyBpbnQgbmV0dnNjX2luaXRfYnVmKHN0
cnVjdCBodl9kZXZpY2UgKmRldmljZSwKPj4gICAJCQkgICBzdHJ1Y3QgbmV0dnNjX2RldmljZSAq
bmV0X2RldmljZSwKPj4gICAJCQkgICBjb25zdCBzdHJ1Y3QgbmV0dnNjX2RldmljZV9pbmZvICpk
ZXZpY2VfaW5mbykKPj4gQEAgLTMzNyw3ICs0NjIsNyBAQCBzdGF0aWMgaW50IG5ldHZzY19pbml0
X2J1ZihzdHJ1Y3QgaHZfZGV2aWNlICpkZXZpY2UsCj4+ICAgCXN0cnVjdCBudnNwXzFfbWVzc2Fn
ZV9zZW5kX3JlY2VpdmVfYnVmZmVyX2NvbXBsZXRlICpyZXNwOwo+PiAgIAlzdHJ1Y3QgbmV0X2Rl
dmljZSAqbmRldiA9IGh2X2dldF9kcnZkYXRhKGRldmljZSk7Cj4+ICAgCXN0cnVjdCBudnNwX21l
c3NhZ2UgKmluaXRfcGFja2V0Owo+PiAtCXVuc2lnbmVkIGludCBidWZfc2l6ZTsKPj4gKwl1bnNp
Z25lZCBpbnQgYnVmX3NpemUsIGFsbG9jX3VuaXQ7Cj4+ICAgCXNpemVfdCBtYXBfd29yZHM7Cj4+
ICAgCWludCBpLCByZXQgPSAwOwo+Pgo+PiBAQCAtMzUwLDcgKzQ3NSwxNCBAQCBzdGF0aWMgaW50
IG5ldHZzY19pbml0X2J1ZihzdHJ1Y3QgaHZfZGV2aWNlICpkZXZpY2UsCj4+ICAgCQlidWZfc2l6
ZSA9IG1pbl90KHVuc2lnbmVkIGludCwgYnVmX3NpemUsCj4+ICAgCQkJCSBORVRWU0NfUkVDRUlW
RV9CVUZGRVJfU0laRV9MRUdBQ1kpOwo+Pgo+PiAtCW5ldF9kZXZpY2UtPnJlY3ZfYnVmID0gdnph
bGxvYyhidWZfc2l6ZSk7Cj4+ICsJaWYgKGh2X2lzb2xhdGlvbl90eXBlX3NucCgpKQo+PiArCQlu
ZXRfZGV2aWNlLT5yZWN2X2J1ZiA9Cj4+ICsJCQluZXR2c2NfYWxsb2NfcGFnZXMoJm5ldF9kZXZp
Y2UtPnJlY3ZfcGFnZXMsCj4+ICsJCQkJCSAgICZuZXRfZGV2aWNlLT5yZWN2X3BhZ2VfY291bnQs
Cj4+ICsJCQkJCSAgIGJ1Zl9zaXplKTsKPj4gKwllbHNlCj4+ICsJCW5ldF9kZXZpY2UtPnJlY3Zf
YnVmID0gdnphbGxvYyhidWZfc2l6ZSk7Cj4+ICsKPiAKPiBJIHdvbmRlciBpZiBpdCBpcyBuZWNl
c3NhcnkgdG8gaGF2ZSB0d28gZGlmZmVyZW50IGNvZGUgcGF0aHMgaGVyZS4gIFRoZQo+IGFsbG9j
YXRpbmcgYW5kIGZyZWVpbmcgb2YgdGhlIHNlbmQgYW5kIHJlY2VpdmUgYnVmZmVycyBpcyBub3Qg
cGVyZgo+IHNlbnNpdGl2ZSwgYW5kIGl0IHNlZW1zIGxpa2UgbmV0dnNjX2FsbG9jX3BhZ2VzKCkg
Y291bGQgYmUgdXNlZAo+IHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBTTlAgSXNvbGF0aW9uIGlzIGlu
IGVmZmVjdC4gIFRvIG15IHRoaW5raW5nLAo+IG9uZSBjb2RlIHBhdGggaXMgYmV0dGVyIHRoYW4g
dHdvIGNvZGUgcGF0aHMgdW5sZXNzIHRoZXJlJ3MgYQo+IGNvbXBlbGxpbmcgcmVhc29uIHRvIGhh
dmUgdHdvLgo+IAo+PiAgIAlpZiAoIW5ldF9kZXZpY2UtPnJlY3ZfYnVmKSB7Cj4+ICAgCQluZXRk
ZXZfZXJyKG5kZXYsCj4+ICAgCQkJICAgInVuYWJsZSB0byBhbGxvY2F0ZSByZWNlaXZlIGJ1ZmZl
ciBvZiBzaXplICV1XG4iLAo+PiBAQCAtMzc1LDYgKzUwNywyNyBAQCBzdGF0aWMgaW50IG5ldHZz
Y19pbml0X2J1ZihzdHJ1Y3QgaHZfZGV2aWNlICpkZXZpY2UsCj4+ICAgCQlnb3RvIGNsZWFudXA7
Cj4+ICAgCX0KPj4KPj4gKwlpZiAoaHZfaXNvbGF0aW9uX3R5cGVfc25wKCkpIHsKPj4gKwkJYWxs
b2NfdW5pdCA9IChidWZfc2l6ZSAvIG5ldF9kZXZpY2UtPnJlY3ZfcGFnZV9jb3VudCkKPj4gKwkJ
CQk+PiBQQUdFX1NISUZUOwo+PiArCj4+ICsJCS8qIFVubWFwIHByZXZpb3VzIHZpcnR1YWwgYWRk
cmVzcyBhbmQgbWFwIHBhZ2VzIGluIHRoZSBleHRyYQo+PiArCQkgKiBhZGRyZXNzIHNwYWNlKGFi
b3ZlIHNoYXJlZCBncGEgYm91bmRhcnkpIGluIElzb2xhdGlvbiBWTS4KPj4gKwkJICovCj4+ICsJ
CXZ1bm1hcChuZXRfZGV2aWNlLT5yZWN2X2J1Zik7Cj4+ICsJCW5ldF9kZXZpY2UtPnJlY3ZfYnVm
ID0KPj4gKwkJCW5ldHZzY19tYXBfcGFnZXMobmV0X2RldmljZS0+cmVjdl9wYWdlcywKPj4gKwkJ
CQkJIG5ldF9kZXZpY2UtPnJlY3ZfcGFnZV9jb3VudCwKPj4gKwkJCQkJIGFsbG9jX3VuaXQpOwo+
PiArCQlpZiAoIW5ldF9kZXZpY2UtPnJlY3ZfYnVmKSB7Cj4+ICsJCQluZXRkZXZfZXJyKG5kZXYs
Cj4+ICsJCQkJICAgInVuYWJsZSB0byBhbGxvY2F0ZSByZWNlaXZlIGJ1ZmZlciBvZiBzaXplICV1
XG4iLAo+PiArCQkJCSAgIGJ1Zl9zaXplKTsKPj4gKwkJCXJldCA9IC1FTk9NRU07Cj4+ICsJCQln
b3RvIGNsZWFudXA7Cj4+ICsJCX0KPj4gKwl9Cj4+ICsKPj4gICAJLyogTm90aWZ5IHRoZSBOZXRW
c3Agb2YgdGhlIGdwYWRsIGhhbmRsZSAqLwo+PiAgIAlpbml0X3BhY2tldCA9ICZuZXRfZGV2aWNl
LT5jaGFubmVsX2luaXRfcGt0Owo+PiAgIAltZW1zZXQoaW5pdF9wYWNrZXQsIDAsIHNpemVvZihz
dHJ1Y3QgbnZzcF9tZXNzYWdlKSk7Cj4+IEBAIC00NTYsMTMgKzYwOSwyMSBAQCBzdGF0aWMgaW50
IG5ldHZzY19pbml0X2J1ZihzdHJ1Y3QgaHZfZGV2aWNlICpkZXZpY2UsCj4+ICAgCWJ1Zl9zaXpl
ID0gZGV2aWNlX2luZm8tPnNlbmRfc2VjdGlvbnMgKiBkZXZpY2VfaW5mby0+c2VuZF9zZWN0aW9u
X3NpemU7Cj4+ICAgCWJ1Zl9zaXplID0gcm91bmRfdXAoYnVmX3NpemUsIFBBR0VfU0laRSk7Cj4+
Cj4+IC0JbmV0X2RldmljZS0+c2VuZF9idWYgPSB2emFsbG9jKGJ1Zl9zaXplKTsKPj4gKwlpZiAo
aHZfaXNvbGF0aW9uX3R5cGVfc25wKCkpCj4+ICsJCW5ldF9kZXZpY2UtPnNlbmRfYnVmID0KPj4g
KwkJCW5ldHZzY19hbGxvY19wYWdlcygmbmV0X2RldmljZS0+c2VuZF9wYWdlcywKPj4gKwkJCQkJ
ICAgJm5ldF9kZXZpY2UtPnNlbmRfcGFnZV9jb3VudCwKPj4gKwkJCQkJICAgYnVmX3NpemUpOwo+
PiArCWVsc2UKPj4gKwkJbmV0X2RldmljZS0+c2VuZF9idWYgPSB2emFsbG9jKGJ1Zl9zaXplKTsK
Pj4gKwo+PiAgIAlpZiAoIW5ldF9kZXZpY2UtPnNlbmRfYnVmKSB7Cj4+ICAgCQluZXRkZXZfZXJy
KG5kZXYsICJ1bmFibGUgdG8gYWxsb2NhdGUgc2VuZCBidWZmZXIgb2Ygc2l6ZSAldVxuIiwKPj4g
ICAJCQkgICBidWZfc2l6ZSk7Cj4+ICAgCQlyZXQgPSAtRU5PTUVNOwo+PiAgIAkJZ290byBjbGVh
bnVwOwo+PiAgIAl9Cj4+ICsKPj4gICAJbmV0X2RldmljZS0+c2VuZF9idWZfc2l6ZSA9IGJ1Zl9z
aXplOwo+Pgo+PiAgIAkvKiBFc3RhYmxpc2ggdGhlIGdwYWRsIGhhbmRsZSBmb3IgdGhpcyBidWZm
ZXIgb24gdGhpcwo+PiBAQCAtNDc4LDYgKzYzOSwyNyBAQCBzdGF0aWMgaW50IG5ldHZzY19pbml0
X2J1ZihzdHJ1Y3QgaHZfZGV2aWNlICpkZXZpY2UsCj4+ICAgCQlnb3RvIGNsZWFudXA7Cj4+ICAg
CX0KPj4KPj4gKwlpZiAoaHZfaXNvbGF0aW9uX3R5cGVfc25wKCkpIHsKPj4gKwkJYWxsb2NfdW5p
dCA9IChidWZfc2l6ZSAvIG5ldF9kZXZpY2UtPnNlbmRfcGFnZV9jb3VudCkKPj4gKwkJCQk+PiBQ
QUdFX1NISUZUOwo+PiArCj4+ICsJCS8qIFVubWFwIHByZXZpb3VzIHZpcnR1YWwgYWRkcmVzcyBh
bmQgbWFwIHBhZ2VzIGluIHRoZSBleHRyYQo+PiArCQkgKiBhZGRyZXNzIHNwYWNlKGFib3ZlIHNo
YXJlZCBncGEgYm91bmRhcnkpIGluIElzb2xhdGlvbiBWTS4KPj4gKwkJICovCj4+ICsJCXZ1bm1h
cChuZXRfZGV2aWNlLT5zZW5kX2J1Zik7Cj4+ICsJCW5ldF9kZXZpY2UtPnNlbmRfYnVmID0KPj4g
KwkJCW5ldHZzY19tYXBfcGFnZXMobmV0X2RldmljZS0+c2VuZF9wYWdlcywKPj4gKwkJCQkJIG5l
dF9kZXZpY2UtPnNlbmRfcGFnZV9jb3VudCwKPj4gKwkJCQkJIGFsbG9jX3VuaXQpOwo+PiArCQlp
ZiAoIW5ldF9kZXZpY2UtPnNlbmRfYnVmKSB7Cj4+ICsJCQluZXRkZXZfZXJyKG5kZXYsCj4+ICsJ
CQkJICAgInVuYWJsZSB0byBhbGxvY2F0ZSByZWNlaXZlIGJ1ZmZlciBvZiBzaXplICV1XG4iLAo+
PiArCQkJCSAgIGJ1Zl9zaXplKTsKPj4gKwkJCXJldCA9IC1FTk9NRU07Cj4+ICsJCQlnb3RvIGNs
ZWFudXA7Cj4+ICsJCX0KPj4gKwl9Cj4+ICsKPj4gICAJLyogTm90aWZ5IHRoZSBOZXRWc3Agb2Yg
dGhlIGdwYWRsIGhhbmRsZSAqLwo+PiAgIAlpbml0X3BhY2tldCA9ICZuZXRfZGV2aWNlLT5jaGFu
bmVsX2luaXRfcGt0Owo+PiAgIAltZW1zZXQoaW5pdF9wYWNrZXQsIDAsIHNpemVvZihzdHJ1Y3Qg
bnZzcF9tZXNzYWdlKSk7Cj4+IEBAIC03NjgsNyArOTUwLDcgQEAgc3RhdGljIHZvaWQgbmV0dnNj
X3NlbmRfdHhfY29tcGxldGUoc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYsCj4+Cj4+ICAgCS8qIE5v
dGlmeSB0aGUgbGF5ZXIgYWJvdmUgdXMgKi8KPj4gICAJaWYgKGxpa2VseShza2IpKSB7Cj4+IC0J
CWNvbnN0IHN0cnVjdCBodl9uZXR2c2NfcGFja2V0ICpwYWNrZXQKPj4gKwkJc3RydWN0IGh2X25l
dHZzY19wYWNrZXQgKnBhY2tldAo+PiAgIAkJCT0gKHN0cnVjdCBodl9uZXR2c2NfcGFja2V0ICop
c2tiLT5jYjsKPj4gICAJCXUzMiBzZW5kX2luZGV4ID0gcGFja2V0LT5zZW5kX2J1Zl9pbmRleDsK
Pj4gICAJCXN0cnVjdCBuZXR2c2Nfc3RhdHMgKnR4X3N0YXRzOwo+PiBAQCAtNzg0LDYgKzk2Niw3
IEBAIHN0YXRpYyB2b2lkIG5ldHZzY19zZW5kX3R4X2NvbXBsZXRlKHN0cnVjdCBuZXRfZGV2aWNl
ICpuZGV2LAo+PiAgIAkJdHhfc3RhdHMtPmJ5dGVzICs9IHBhY2tldC0+dG90YWxfYnl0ZXM7Cj4+
ICAgCQl1NjRfc3RhdHNfdXBkYXRlX2VuZCgmdHhfc3RhdHMtPnN5bmNwKTsKPj4KPj4gKwkJbmV0
dnNjX2RtYV91bm1hcChuZGV2X2N0eC0+ZGV2aWNlX2N0eCwgcGFja2V0KTsKPj4gICAJCW5hcGlf
Y29uc3VtZV9za2Ioc2tiLCBidWRnZXQpOwo+PiAgIAl9Cj4+Cj4+IEBAIC05NDgsNiArMTEzMSw4
NyBAQCBzdGF0aWMgdm9pZCBuZXR2c2NfY29weV90b19zZW5kX2J1ZihzdHJ1Y3QgbmV0dnNjX2Rl
dmljZSAqbmV0X2RldmljZSwKPj4gICAJCW1lbXNldChkZXN0LCAwLCBwYWRkaW5nKTsKPj4gICB9
Cj4+Cj4+ICt2b2lkIG5ldHZzY19kbWFfdW5tYXAoc3RydWN0IGh2X2RldmljZSAqaHZfZGV2LAo+
PiArCQkgICAgICBzdHJ1Y3QgaHZfbmV0dnNjX3BhY2tldCAqcGFja2V0KQo+PiArewo+PiArCXUz
MiBwYWdlX2NvdW50ID0gcGFja2V0LT5jcF9wYXJ0aWFsID8KPj4gKwkJcGFja2V0LT5wYWdlX2J1
Zl9jbnQgLSBwYWNrZXQtPnJtc2dfcGdjbnQgOgo+PiArCQlwYWNrZXQtPnBhZ2VfYnVmX2NudDsK
Pj4gKwlpbnQgaTsKPj4gKwo+PiArCWlmICghaHZfaXNfaXNvbGF0aW9uX3N1cHBvcnRlZCgpKQo+
PiArCQlyZXR1cm47Cj4+ICsKPj4gKwlpZiAoIXBhY2tldC0+ZG1hX3JhbmdlKQo+PiArCQlyZXR1
cm47Cj4+ICsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgcGFnZV9jb3VudDsgaSsrKQo+PiArCQlkbWFf
dW5tYXBfc2luZ2xlKCZodl9kZXYtPmRldmljZSwgcGFja2V0LT5kbWFfcmFuZ2VbaV0uZG1hLAo+
PiArCQkJCSBwYWNrZXQtPmRtYV9yYW5nZVtpXS5tYXBwaW5nX3NpemUsCj4+ICsJCQkJIERNQV9U
T19ERVZJQ0UpOwo+PiArCj4+ICsJa2ZyZWUocGFja2V0LT5kbWFfcmFuZ2UpOwo+PiArfQo+PiAr
Cj4+ICsvKiBuZXR2c2NfZG1hX21hcCAtIE1hcCBzd2lvdGxiIGJvdW5jZSBidWZmZXIgd2l0aCBk
YXRhIHBhZ2Ugb2YKPj4gKyAqIHBhY2tldCBzZW50IGJ5IHZtYnVzX3NlbmRwYWNrZXRfcGFnZWJ1
ZmZlcigpIGluIHRoZSBJc29sYXRpb24KPj4gKyAqIFZNLgo+PiArICoKPj4gKyAqIEluIGlzb2xh
dGlvbiBWTSwgbmV0dnNjIHNlbmQgYnVmZmVyIGhhcyBiZWVuIG1hcmtlZCB2aXNpYmxlIHRvCj4+
ICsgKiBob3N0IGFuZCBzbyB0aGUgZGF0YSBjb3BpZWQgdG8gc2VuZCBidWZmZXIgZG9lc24ndCBu
ZWVkIHRvIHVzZQo+PiArICogYm91bmNlIGJ1ZmZlci4gVGhlIGRhdGEgcGFnZXMgaGFuZGxlZCBi
eSB2bWJ1c19zZW5kcGFja2V0X3BhZ2VidWZmZXIoKQo+PiArICogbWF5IG5vdCBiZSBjb3BpZWQg
dG8gc2VuZCBidWZmZXIgYW5kIHNvIHRoZXNlIHBhZ2VzIG5lZWQgdG8gYmUKPj4gKyAqIG1hcHBl
ZCB3aXRoIHN3aW90bGIgYm91bmNlIGJ1ZmZlci4gbmV0dnNjX2RtYV9tYXAoKSBpcyB0byBkbwo+
PiArICogdGhhdC4gVGhlIHBmbnMgaW4gdGhlIHN0cnVjdCBodl9wYWdlX2J1ZmZlciBuZWVkIHRv
IGJlIGNvbnZlcnRlZAo+PiArICogdG8gYm91bmNlIGJ1ZmZlcidzIHBmbi4gVGhlIGxvb3AgaGVy
ZSBpcyBuZWNlc3NhcnkgYmVjYXVzZSB0aGUKPj4gKyAqIGVudHJpZXMgaW4gdGhlIHBhZ2UgYnVm
ZmVyIGFycmF5IGFyZSBub3QgbmVjZXNzYXJpbHkgZnVsbAo+PiArICogcGFnZXMgb2YgZGF0YS4g
IEVhY2ggZW50cnkgaW4gdGhlIGFycmF5IGhhcyBhIHNlcGFyYXRlIG9mZnNldCBhbmQKPj4gKyAq
IGxlbiB0aGF0IG1heSBiZSBub24temVybywgZXZlbiBmb3IgZW50cmllcyBpbiB0aGUgbWlkZGxl
IG9mIHRoZQo+PiArICogYXJyYXkuICBBbmQgdGhlIGVudHJpZXMgYXJlIG5vdCBwaHlzaWNhbGx5
IGNvbnRpZ3VvdXMuICBTbyBlYWNoCj4+ICsgKiBlbnRyeSBtdXN0IGJlIGluZGl2aWR1YWxseSBt
YXBwZWQgcmF0aGVyIHRoYW4gYXMgYSBjb250aWd1b3VzIHVuaXQuCj4+ICsgKiBTbyBub3QgdXNl
IGRtYV9tYXBfc2coKSBoZXJlLgo+PiArICovCj4+ICtzdGF0aWMgaW50IG5ldHZzY19kbWFfbWFw
KHN0cnVjdCBodl9kZXZpY2UgKmh2X2RldiwKPj4gKwkJICAgc3RydWN0IGh2X25ldHZzY19wYWNr
ZXQgKnBhY2tldCwKPj4gKwkJICAgc3RydWN0IGh2X3BhZ2VfYnVmZmVyICpwYikKPj4gK3sKPj4g
Kwl1MzIgcGFnZV9jb3VudCA9ICBwYWNrZXQtPmNwX3BhcnRpYWwgPwo+PiArCQlwYWNrZXQtPnBh
Z2VfYnVmX2NudCAtIHBhY2tldC0+cm1zZ19wZ2NudCA6Cj4+ICsJCXBhY2tldC0+cGFnZV9idWZf
Y250Owo+PiArCWRtYV9hZGRyX3QgZG1hOwo+PiArCWludCBpOwo+PiArCj4+ICsJaWYgKCFodl9p
c19pc29sYXRpb25fc3VwcG9ydGVkKCkpCj4+ICsJCXJldHVybiAwOwo+PiArCj4+ICsJcGFja2V0
LT5kbWFfcmFuZ2UgPSBrY2FsbG9jKHBhZ2VfY291bnQsCj4+ICsJCQkJICAgIHNpemVvZigqcGFj
a2V0LT5kbWFfcmFuZ2UpLAo+PiArCQkJCSAgICBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXBhY2tl
dC0+ZG1hX3JhbmdlKQo+PiArCQlyZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArCWZvciAoaSA9IDA7
IGkgPCBwYWdlX2NvdW50OyBpKyspIHsKPj4gKwkJY2hhciAqc3JjID0gcGh5c190b192aXJ0KChw
YltpXS5wZm4gPDwgSFZfSFlQX1BBR0VfU0hJRlQpCj4+ICsJCQkJCSArIHBiW2ldLm9mZnNldCk7
Cj4+ICsJCXUzMiBsZW4gPSBwYltpXS5sZW47Cj4+ICsKPj4gKwkJZG1hID0gZG1hX21hcF9zaW5n
bGUoJmh2X2Rldi0+ZGV2aWNlLCBzcmMsIGxlbiwKPj4gKwkJCQkgICAgIERNQV9UT19ERVZJQ0Up
Owo+PiArCQlpZiAoZG1hX21hcHBpbmdfZXJyb3IoJmh2X2Rldi0+ZGV2aWNlLCBkbWEpKSB7Cj4+
ICsJCQlrZnJlZShwYWNrZXQtPmRtYV9yYW5nZSk7Cj4+ICsJCQlyZXR1cm4gLUVOT01FTTsKPj4g
KwkJfQo+PiArCj4+ICsJCXBhY2tldC0+ZG1hX3JhbmdlW2ldLmRtYSA9IGRtYTsKPj4gKwkJcGFj
a2V0LT5kbWFfcmFuZ2VbaV0ubWFwcGluZ19zaXplID0gbGVuOwo+PiArCQlwYltpXS5wZm4gPSBk
bWEgPj4gSFZfSFlQX1BBR0VfU0hJRlQ7Cj4+ICsJCXBiW2ldLm9mZnNldCA9IG9mZnNldF9pbl9o
dnBhZ2UoZG1hKTsKPiAKPiBXaXRoIHRoZSBETUEgbWluIGFsaWduIG1hc2sgbm93IGJlaW5nIHNl
dCwgdGhlIG9mZnNldCB3aXRoaW4KPiB0aGUgSHlwZXItViBwYWdlIHdvbid0IGJlIGNoYW5nZWQg
YnkgZG1hX21hcF9zaW5nbGUoKS4gIFNvIEkKPiB0aGluayB0aGUgYWJvdmUgc3RhdGVtZW50IGNh
biBiZSByZW1vdmVkLgo+IAo+PiArCQlwYltpXS5sZW4gPSBsZW47Cj4gCj4gQSBmZXcgbGluZXMg
YWJvdmUsIHRoZSB2YWx1ZSBvZiAibGVuIiBpcyBzZXQgZnJvbSBwYltpXS5sZW4uICBOZWl0aGVy
Cj4gImxlbiIgbm9yICJpIiBpcyBjaGFuZ2VkIGluIHRoZSBsb29wLCBzbyB0aGlzIHN0YXRlbWVu
dCBjYW4gYWxzbyBiZQo+IHJlbW92ZWQuCj4gCj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+
ICt9Cj4+ICsKPj4gICBzdGF0aWMgaW5saW5lIGludCBuZXR2c2Nfc2VuZF9wa3QoCj4+ICAgCXN0
cnVjdCBodl9kZXZpY2UgKmRldmljZSwKPj4gICAJc3RydWN0IGh2X25ldHZzY19wYWNrZXQgKnBh
Y2tldCwKPj4gQEAgLTk4OCwxNCArMTI1MiwyNCBAQCBzdGF0aWMgaW5saW5lIGludCBuZXR2c2Nf
c2VuZF9wa3QoCj4+Cj4+ICAgCXRyYWNlX252c3Bfc2VuZF9wa3QobmRldiwgb3V0X2NoYW5uZWws
IHJwa3QpOwo+Pgo+PiArCXBhY2tldC0+ZG1hX3JhbmdlID0gTlVMTDsKPj4gICAJaWYgKHBhY2tl
dC0+cGFnZV9idWZfY250KSB7Cj4+ICAgCQlpZiAocGFja2V0LT5jcF9wYXJ0aWFsKQo+PiAgIAkJ
CXBiICs9IHBhY2tldC0+cm1zZ19wZ2NudDsKPj4KPj4gKwkJcmV0ID0gbmV0dnNjX2RtYV9tYXAo
bmRldl9jdHgtPmRldmljZV9jdHgsIHBhY2tldCwgcGIpOwo+PiArCQlpZiAocmV0KSB7Cj4+ICsJ
CQlyZXQgPSAtRUFHQUlOOwo+PiArCQkJZ290byBleGl0Owo+PiArCQl9Cj4+ICsKPj4gICAJCXJl
dCA9IHZtYnVzX3NlbmRwYWNrZXRfcGFnZWJ1ZmZlcihvdXRfY2hhbm5lbCwKPj4gICAJCQkJCQkg
IHBiLCBwYWNrZXQtPnBhZ2VfYnVmX2NudCwKPj4gICAJCQkJCQkgICZudm1zZywgc2l6ZW9mKG52
bXNnKSwKPj4gICAJCQkJCQkgIHJlcV9pZCk7Cj4+ICsKPj4gKwkJaWYgKHJldCkKPj4gKwkJCW5l
dHZzY19kbWFfdW5tYXAobmRldl9jdHgtPmRldmljZV9jdHgsIHBhY2tldCk7Cj4+ICAgCX0gZWxz
ZSB7Cj4+ICAgCQlyZXQgPSB2bWJ1c19zZW5kcGFja2V0KG91dF9jaGFubmVsLAo+PiAgIAkJCQkg
ICAgICAgJm52bXNnLCBzaXplb2YobnZtc2cpLAo+PiBAQCAtMTAwMyw2ICsxMjc3LDcgQEAgc3Rh
dGljIGlubGluZSBpbnQgbmV0dnNjX3NlbmRfcGt0KAo+PiAgIAkJCQkgICAgICAgVk1CVVNfREFU
QV9QQUNLRVRfRkxBR19DT01QTEVUSU9OX1JFUVVFU1RFRCk7Cj4+ICAgCX0KPj4KPj4gK2V4aXQ6
Cj4+ICAgCWlmIChyZXQgPT0gMCkgewo+PiAgIAkJYXRvbWljX2luY19yZXR1cm4oJm52Y2hhbi0+
cXVldWVfc2VuZHMpOwo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZz
Y19kcnYuYyBiL2RyaXZlcnMvbmV0L2h5cGVydi9uZXR2c2NfZHJ2LmMKPj4gaW5kZXggMzgyYmVi
YzI0MjBkLi5jM2RjODg0YjMxZTMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L2h5cGVydi9u
ZXR2c2NfZHJ2LmMKPj4gKysrIGIvZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzY19kcnYuYwo+PiBA
QCAtMjU3Nyw2ICsyNTc3LDcgQEAgc3RhdGljIGludCBuZXR2c2NfcHJvYmUoc3RydWN0IGh2X2Rl
dmljZSAqZGV2LAo+PiAgIAlsaXN0X2FkZCgmbmV0X2RldmljZV9jdHgtPmxpc3QsICZuZXR2c2Nf
ZGV2X2xpc3QpOwo+PiAgIAlydG5sX3VubG9jaygpOwo+Pgo+PiArCWRtYV9zZXRfbWluX2FsaWdu
X21hc2soJmRldi0+ZGV2aWNlLCBIVl9IWVBfUEFHRV9TSVpFIC0gMSk7Cj4+ICAgCW5ldHZzY19k
ZXZpbmZvX3B1dChkZXZpY2VfaW5mbyk7Cj4+ICAgCXJldHVybiAwOwo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvaHlwZXJ2L3JuZGlzX2ZpbHRlci5jIGIvZHJpdmVycy9uZXQvaHlwZXJ2
L3JuZGlzX2ZpbHRlci5jCj4+IGluZGV4IGY2YzljMmE2NzBmOS4uNDQ4ZmNjMzI1ZWQ3IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9oeXBlcnYvcm5kaXNfZmlsdGVyLmMKPj4gKysrIGIvZHJp
dmVycy9uZXQvaHlwZXJ2L3JuZGlzX2ZpbHRlci5jCj4+IEBAIC0zNjEsNiArMzYxLDggQEAgc3Rh
dGljIHZvaWQgcm5kaXNfZmlsdGVyX3JlY2VpdmVfcmVzcG9uc2Uoc3RydWN0IG5ldF9kZXZpY2Ug
Km5kZXYsCj4+ICAgCQkJfQo+PiAgIAkJfQo+Pgo+PiArCQluZXR2c2NfZG1hX3VubWFwKCgoc3Ry
dWN0IG5ldF9kZXZpY2VfY29udGV4dCAqKQo+PiArCQkJbmV0ZGV2X3ByaXYobmRldikpLT5kZXZp
Y2VfY3R4LCAmcmVxdWVzdC0+cGt0KTsKPj4gICAJCWNvbXBsZXRlKCZyZXF1ZXN0LT53YWl0X2V2
ZW50KTsKPj4gICAJfSBlbHNlIHsKPj4gICAJCW5ldGRldl9lcnIobmRldiwKPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaHlwZXJ2LmggYi9pbmNsdWRlL2xpbnV4L2h5cGVydi5oCj4+IGlu
ZGV4IGM5NGM1MzRhOTQ0ZS4uODFlNThkZDU4MmRjIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2h5cGVydi5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvaHlwZXJ2LmgKPj4gQEAgLTE1OTcs
NiArMTU5NywxMSBAQCBzdHJ1Y3QgaHlwZXJ2X3NlcnZpY2VfY2FsbGJhY2sgewo+PiAgIAl2b2lk
ICgqY2FsbGJhY2spKHZvaWQgKmNvbnRleHQpOwo+PiAgIH07Cj4+Cj4+ICtzdHJ1Y3QgaHZfZG1h
X3JhbmdlIHsKPj4gKwlkbWFfYWRkcl90IGRtYTsKPj4gKwl1MzIgbWFwcGluZ19zaXplOwo+PiAr
fTsKPj4gKwo+PiAgICNkZWZpbmUgTUFYX1NSVl9WRVIJMHg3ZmZmZmZmCj4+ICAgZXh0ZXJuIGJv
b2wgdm1idXNfcHJlcF9uZWdvdGlhdGVfcmVzcChzdHJ1Y3QgaWNtc2dfaGRyICppY21zZ2hkcnAs
IHU4ICpidWYsIHUzMiBidWZsZW4sCj4+ICAgCQkJCWNvbnN0IGludCAqZndfdmVyc2lvbiwgaW50
IGZ3X3ZlcmNudCwKPj4gLS0KPj4gMi4yNS4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9pb21tdQ==
