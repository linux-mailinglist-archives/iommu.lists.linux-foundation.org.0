Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A643269B9
	for <lists.iommu@lfdr.de>; Fri, 26 Feb 2021 22:55:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BCC74F0C9;
	Fri, 26 Feb 2021 21:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRtmlUi8ecBs; Fri, 26 Feb 2021 21:55:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48A494F0C8;
	Fri, 26 Feb 2021 21:55:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29E90C0001;
	Fri, 26 Feb 2021 21:55:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 795D2C0001
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 21:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5245943430
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 21:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxSZ5QDJYF8o for <iommu@lists.linux-foundation.org>;
 Fri, 26 Feb 2021 21:55:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A927C43421
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 21:55:18 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id p16so11224446ioj.4
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 13:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TbbG+K21OJksMSriRBsOnkJNEbaTjI1alnvlyWlecpQ=;
 b=PgkgDjZa97MDV9/Y8FaGFSjOFOKXBpNT06a5oxs2Czk9XCjecD+COXpqVKv844w6CB
 gAOfjg2mIaQFtRaW/ECx/j3YWKsMqhi7ev/2c8a6NMfX9hG+xl1eY+JBWSekfUsMVF1X
 eZZMhPhIMT57mfWIHBORF8HW0lTc+BQpQx7AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TbbG+K21OJksMSriRBsOnkJNEbaTjI1alnvlyWlecpQ=;
 b=RClmrmfTyFnPKLkkZWeJCCQvnhGceDXQNDyP3I/m5GurUg8C+2iG+dFjtwAn4kMbF9
 iw//QIW+RDlAzXqVI3c39XTv1f3GE1iy5x/NoMqNjwvvflab0cTlOHHtUBw3uRrkTeuC
 sCp0vze+DECJm91gkyaAqr2BjAtTda7TZ7DllQR4eBWH75YkYh0W1crlGovFq2pL2YpU
 Fi3tOONgapwHfiJxQfVxQCXiLpMzlOC0kZ1Y39tAcLCdBhhq2sZ3TMAV/9F/Inp6tBm/
 DYf8AgVAruaAFqNsrUQ7QUbE6NDpJd7Y124uN4HiwFR7Mzmfwrrmm0aAfPfLb9U1XZs6
 8eaQ==
X-Gm-Message-State: AOAM530XysC4Y1nlxm5l/C6Nk26ru8J2JCGyni20INu+wZUZawmD+S6+
 waRHNKQa6I7mNBdfxXB8N/V75Jlh
X-Google-Smtp-Source: ABdhPJzu77gtIIuiUcz9cXqvS/WNpBNLjZbJf8JWOBHfSvJRNrkLY3fbuksgVXKop3px+qiLCwJylA==
X-Received: by 2002:a02:4087:: with SMTP id n129mr5042155jaa.143.1614376517727; 
 Fri, 26 Feb 2021 13:55:17 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id x17sm5298087ilm.40.2021.02.26.13.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 13:55:17 -0800 (PST)
Subject: Re: [PATCH] iommu/amd: Fix event counter availability check
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Alexander Monakov <amonakov@ispras.ru>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20200529200738.1923-1-amonakov@ispras.ru>
 <alpine.LNX.2.20.13.2005311014450.16067@monopod.intra.ispras.ru>
 <c0f9f676-eff8-572d-9174-4c22c6095a3d@linuxfoundation.org>
 <alpine.LNX.2.20.13.2006030935570.3181@monopod.intra.ispras.ru>
 <4aba4c61-1878-3d4e-d52e-3ccac9715010@molgen.mpg.de>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <e4e0861a-0a27-3765-5b63-161bb9bdb775@linuxfoundation.org>
Date: Fri, 26 Feb 2021 14:55:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4aba4c61-1878-3d4e-d52e-3ccac9715010@molgen.mpg.de>
Content-Language: en-US
Cc: David Coe <david.coe@live.co.uk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Shuah Khan <skhan@linuxfoundation.org>,
 "Tj \(Elloe Linux\)" <ml.linux@elloe.vision>
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

T24gMi8yNi8yMSAyOjQ0IFBNLCBQYXVsIE1lbnplbCB3cm90ZToKPiBbY2M6ICtzdXJhdmVlLCAr
asO2cmddCj4gCj4gRGVhciBBbGV4LCBkZWFyIFNodWFoLCBkZWFyIFN1cmF2ZWUsIGRlYXIgSsO2
cmcsCj4gCj4gCj4gQW0gMDMuMDYuMjAgdW0gMDg6NTQgc2NocmllYiBBbGV4YW5kZXIgTW9uYWtv
djoKPj4gT24gVHVlLCAyIEp1biAyMDIwLCBTaHVhaCBLaGFuIHdyb3RlOgo+Pgo+Pj4gSSBjaGFu
Z2VkIHRoZSBsb2dpYyB0byByZWFkIGNvbmZpZyB0byBnZXQgbWF4IGJhbmtzIGFuZCBjb3VudGVy
cwo+Pj4gYmVmb3JlIGNoZWNraW5nIGlmIGNvdW50ZXJzIGFyZSB3cml0YWJsZSBhbmQgdHJpZWQg
d3JpdGluZyB0byBhbGwuCj4+PiBUaGUgcmVzdWx0IGlzIHRoZSBzYW1lIGFuZCBhbGwgb2YgdGhl
bSBhcmVuJ3Qgd3JpdGFibGUuIEhvd2V2ZXIsCj4+PiB3aGVuIGRpc2FibGUgdGhlIHdyaXRhYmxl
IGNoZWNrIGFuZCBhc3N1bWUgdGhleSBhcmUsIEkgY2FuIHJ1bgo+PiBbc25pcF0KPj4KPj4gVGhp
cyBpcyBzaW1pbGFyIHRvIHdoYXQgSSBkaWQuIEkgYWxzbyBub3RpY2VkIHRoYXQgY291bnRlcnMg
Y2FuCj4+IGJlIHN1Y2Nlc3NmdWxseSB1c2VkIHdpdGggcGVyZiBpZiB0aGUgaW5pdGlhbCBjaGVj
ayBpcyBpZ25vcmVkLgo+PiBJIHdhcyBjb25zaWRlcmluZyBzZW5kaW5nIGEgcGF0Y2ggdG8gcmVt
b3ZlIHRoZSBjaGVjayBhbmQgYWRqdXN0Cj4+IHRoZSBldmVudCBjb3VudGluZyBsb2dpYyB0byB1
c2UgY291bnRlcnMgYXMgcmVhZC1vbmx5LCBidXQgYWZ0ZXIKPj4gYSBiaXQgbW9yZSBpbnZlc3Rp
Z2F0aW9uIEkndmUgbm90aWNlZCBob3cgbGF0ZSBwY2lfZW5hYmxlX2RldmljZQo+PiBpcyBkb25l
LCBhbmQgY2FtZSB1cCB3aXRoIHRoaXMgcGF0Y2guIEl0J3MgYSBwYXRoIG9mIGxlc3MgcmVzaXN0
YW5jZToKPj4gSSdkIGV4cGVjdCBtYWludGFpbmVycyB0byBiZSBtb3JlIGF2ZXJzZSB0byByZW1v
dmluZyB0aGUgY2hlY2sKPj4gcmF0aGVyIHRoYW4gZml4aW5nIGl0IHNvIGl0IHdvcmtzIGFzIGlu
dGVuZGVkIChldmVuIHRob3VnaCBJIHRoaW5rCj4+IHRoZSBjaGVjayBzaG91bGQgbm90IGJlIHRo
ZXJlIGluIHRoZSBmaXJzdCBwbGFjZSkuCj4+Cj4+IEhvd2V2ZXI6Cj4+Cj4+IFRoZSBhYmlsaXR5
IHRvIG1vZGlmeSB0aGUgY291bnRlcnMgaXMgbmVlZGVkIG9ubHkgZm9yIHNhbXBsaW5nIHRoZQo+
PiBldmVudHMgKGdldHRpbmcgYW4gaW50ZXJydXB0IHdoZW4gYSBjb3VudGVyIG92ZXJmbG93cyku
IFRoZXJlJ3Mgbm8KPj4gY29kZSB0byBkbyB0aGF0IGZvciB0aGVzZSBBTUQgSU9NTVUgY291bnRl
cnMuIEEgc29sdXRpb24gSSB3b3VsZAo+PiBwcmVmZXIgaXMgdG8gbm90IHdyaXRlIHRvIHRob3Nl
IGNvdW50ZXJzIGF0IGFsbC4gSXQgd291bGQgc2ltcGxpZnkgb3IKPj4gZXZlbiByZW1vdmUgYSBi
dW5jaCBvZiBjb2RlLiBJIGNhbiBzdWJtaXQgYSBjb3JyZXNwb25kaW5nIHBhdGNoIGlmCj4+IHRo
ZXJlJ3MgZ2VuZXJhbCBhZ3JlZW1lbnQgdGhpcyBwYXRoIGlzIG9rLgo+Pgo+PiBXaGF0IGRvIHlv
dSB0aGluaz8KPiAKPiBJIGxpa2UgdGhpcyBpZGVhLiBTdXJhdmVlLCBKw7ZyZywgd2hhdCBkbyB5
b3UgdGhpbms/Cj4gCj4gQ29tbWl0IDY3NzhmZjViMjFiIChpb21tdS9hbWQ6IEZpeCBwZXJmb3Jt
YW5jZSBjb3VudGVyIGluaXRpYWxpemF0aW9uKSAKPiBkZWxheXMgdGhlIGJvb3QgdXAgdG8gMTAw
IG1zLCB3aGljaCBpcyBvdmVyIDIwICUgb24gZmFzdCBzeXN0ZW1zLCBhbmQgCj4gYWxzbyBqdXN0
IGEgd29ya2Fyb3VuZCwgYW5kIGRvZXMgbm90IHNlZW0gdG8gd29yayBhbHdheXMuIFRoZSBkZWxh
eSBpcyAKPiBhbHNvIG5vdCBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+IAo+CgpT
b3VuZHMgZ29vZCB0byBtZS4gSSBjYW4gdGVzdCB0aGlzIG91dCBvbiBteSBzeXN0ZW0uCgp0aGFu
a3MsCi0tIFNodWFoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
