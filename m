Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B92FF27895A
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 15:21:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D61886BC7;
	Fri, 25 Sep 2020 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Piu9eaxl1EDJ; Fri, 25 Sep 2020 13:21:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9393786BCB;
	Fri, 25 Sep 2020 13:21:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F516C0051;
	Fri, 25 Sep 2020 13:21:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7C6FC0051
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 13:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 90EB486BC7
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 13:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7gvSF3P-n7y for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 13:21:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 976DC86BC0
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 13:21:21 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id w11so2805051lfn.2
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HSGaf1eGfw5tIztilXD8fvlle7SWUYGVsu5F+1o/XiE=;
 b=EEZna10+58DvlojMGo1TeKlWT6WjoHMAhd0OJFLVx2SF/7VD6C6y4Oy8IoTTWuYxK4
 PiT7gPA+chFaoJSFa5IH4+vwnYVVR9C6Deo4tX9FDZ/Tm/wypL0EEMa8TYHSzZ4ADRZm
 rZOqEZHofpSf/VfzEY3zkA7acZyOzOSKjx2i4cbpfvp+90cKqEdpPFzqzAJDiYMrE+eG
 QIwSBFSTHaN7Yb64ESK5zBDs1290HrqX2pFHMzXkszsxh9lL7iCVf4Z7rgIIkS+fnbAp
 R+7tkOli2jgkEZ/Tp0WBoAuypuzzrH8SaSin1iGBuMtuLuoDC8bjw9Yv55kPRWw5oTkw
 XHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HSGaf1eGfw5tIztilXD8fvlle7SWUYGVsu5F+1o/XiE=;
 b=mvJi674UKbJFXTBDQe0OE6Gfe8Pf1HRJtaFZsD3ppUC92xX9AO/pYcJc5O49xqNhOq
 S9YgdLxacpIiseSB222zs6ElpyJlfe18/THgmZszC5AZgW7ZaoTkKyTV6EAqHxorKAG3
 Kfa9YQOZlxyJFOhvB46YN+Seob8Lx2CuY90HfayBinpWFMBhYwNsTk5zEUFJHPB6rn+g
 jZY4MfySGWCVfbK/puM7tcJYmUI/j8L5J6DT2Ea3Km7/Qi/ey4HIxOatUZDpXQKnivw0
 btOoVLdr3mpIPKG/enoErjTgYePiCCX642+N0wvj4tAloB62VReulM9GNiqvNdmyqtlL
 AmgQ==
X-Gm-Message-State: AOAM531FfVuIM5pcgBpfL8CTuqIInH9XR9FHG13B7m0UCnvPQ6WUf+Tl
 5ARJVsx+3udyz7QkBjJcf0Y=
X-Google-Smtp-Source: ABdhPJy7rFSI4LluJaDLNquOaxpLE+A82l9X3D9ZLpwTjDfKunUJpoe/hTAG9P68Jq4PI26/OrtgEw==
X-Received: by 2002:ac2:491e:: with SMTP id n30mr1274466lfi.395.1601040079799; 
 Fri, 25 Sep 2020 06:21:19 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id 82sm2247569lfo.173.2020.09.25.06.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 06:21:19 -0700 (PDT)
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
Message-ID: <70712ca4-8971-3af4-d0d0-b73788d6cfa9@gmail.com>
Date: Fri, 25 Sep 2020 16:21:17 +0300
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

MjUuMDkuMjAyMCAxNTozOSwgUm9iaW4gTXVycGh5INC/0LjRiNC10YI6Ci4uLgo+PiBJSVJDLCBp
biB0aGUgcGFzdCBSb2JpbiBNdXJwaHkgd2FzIHN1Z2dlc3RpbmcgdG8gcmVhZCBvdXQgaGFyZHdh
cmUgc3RhdGUKPj4gZWFybHkgZHVyaW5nIGtlcm5lbCBib290IGluIG9yZGVyIHRvIGZpbmQgd2hh
dCByZWdpb25zIGFyZSBpbiB1c2UgYnkKPj4gaGFyZHdhcmUuCj4gCj4gSSBkb3VidCBJIHN1Z2dl
c3RlZCB0aGF0IGluIGdlbmVyYWwsIGJlY2F1c2UgSSd2ZSBhbHdheXMgZmlybWx5IGJlbGlldmVk
Cj4gaXQgdG8gYmUgYSB0ZXJyaWJsZSBpZGVhLiBJJ3ZlIGRlYnVnZ2VkIHRvbyBtYW55IGNhc2Vz
IHdoZXJlIGZpcm13YXJlIG9yCj4ga2V4ZWMgaGFzIGluYWR2ZXJ0ZW50bHkgbGVmdCBETUEgcnVu
bmluZyBhbmQgY29ycnVwdGVkIGtlcm5lbCBtZW1vcnksIHNvCj4gaW4gZ2VuZXJhbCB3ZSBkZWZp
bml0ZWx5ICpkb24ndCogd2FudCB0byBibGluZGx5IHRydXN0IHJhbmRvbSBoYXJkd2FyZQo+IHN0
YXRlLiBBbnl0aGluZyBJIG1heSBoYXZlIHNhaWQgaW4gcmVsYXRpb24gdG8gUXVhbGNvbW0ncyBm
dW5kYW1lbnRhbGx5Cj4gYnJva2VuIGh5cGVydmlzb3IvYm9vdGxvYWRlciBzZXR1cCBzaG91bGQg
bm90IGJlIGNvbnNpZGVyZWQgb3V0c2lkZSB0aGF0Cj4gc3BlY2lmaWMgY29udGV4dCA7KQo+IAo+
IFJvYmluLgo+IAo+PiBJIHRoaW5rIGl0IHNob3VsZCBiZSBlYXN5IHRvIGRvIGZvciB0aGUgZGlz
cGxheSBjb250cm9sbGVyIHNpbmNlIHdlCj4+IGNvdWxkIGNoZWNrIGNsb2NrIGFuZCBQRCBzdGF0
ZXMgaW4gb3JkZXIgdG8gZGVjaWRlIHdoZXRoZXIgREMncyBJTyBjb3VsZAo+PiBiZSBhY2Nlc3Nl
ZCBhbmQgdGhlbiByZWFkIG91dCB0aGUgRkIgcG9pbnRlciBhbmQgc2l6ZS4gSSBndWVzcyBpdCBz
aG91bGQKPj4gdGFrZSBhYm91dCBodW5kcmVkIGxpbmVzIG9mIGNvZGUuCgpUaGUgYWN0aXZlIERN
QSBpcyBpbmRlZWQgdmVyeSBkYW5nZXJvdXMsIGJ1dCBpdCdzIGEgYml0IGxlc3MgZGFuZ2Vyb3Vz
CmluIGEgY2FzZSBvZiByZWFkLW9ubHkgRE1BLgoKSSBnb3QgYW5vdGhlciBpZGVhIG9mIGhvdyB3
ZSBjb3VsZCBiZW5lZml0IGZyb20gdGhlIGFjdGl2ZSBkaXNwbGF5CmhhcmR3YXJlLiBNYXliZSB3
ZSBjb3VsZCBkbyB0aGUgZm9sbG93aW5nOgoKMS4gQ2hlY2sgd2hldGhlciBkaXNwbGF5IGlzIGFj
dGl2ZQoKMi4gQWxsb2NhdGUgQ01BIHRoYXQgbWF0Y2hlcyB0aGUgRkIgc2l6ZQoKMy4gQ3JlYXRl
IGlkZW50aXR5IG1hcHBpbmcgZm9yIHRoZSBDTUEKCjQuIFN3aXRjaCBkaXNwbGF5IGZyYW1lYnVm
ZmVyIHRvIG91ciBDTUEKCjUuIENyZWF0ZSB2ZXJ5IGVhcmx5IHNpbXBsZS1mcmFtZWJ1ZmZlciBv
dXQgb2YgdGhlIENNQQoKNi4gT25jZSBUZWdyYSBEUk0gZHJpdmVyIGlzIGxvYWRlZCwgaXQgd2ls
bCBraWNrIG91dCB0aGUgc2ltcGxlLWZiLCBhbmQKdGh1cywgcmVsZWFzZSB0ZW1wb3JhbCBDTUEg
YW5kIGlkZW50aXR5IG1hcHBpbmcuCgpUaGlzIHdpbGwgcHJvdmlkZSB1cyB3aXRoIGEgdmVyeSBl
YXJseSBmcmFtZWJ1ZmZlciBvdXRwdXQgYW5kIGl0IHdpbGwKd29yayBvbiBhbGwgZGV2aWNlcyBv
dXQtb2YtdGhlLWJveCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
