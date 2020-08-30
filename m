Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C0257043
	for <lists.iommu@lfdr.de>; Sun, 30 Aug 2020 21:44:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F2FC84A0F;
	Sun, 30 Aug 2020 19:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMPWWx4vnZFq; Sun, 30 Aug 2020 19:44:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 243E0844A1;
	Sun, 30 Aug 2020 19:44:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4490C0891;
	Sun, 30 Aug 2020 19:44:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62E5DC0051
 for <iommu@lists.linux-foundation.org>; Sun, 30 Aug 2020 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49AA5874BA
 for <iommu@lists.linux-foundation.org>; Sun, 30 Aug 2020 19:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEfOSyujCuYt for <iommu@lists.linux-foundation.org>;
 Sun, 30 Aug 2020 19:44:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6228F8749A
 for <iommu@lists.linux-foundation.org>; Sun, 30 Aug 2020 19:44:42 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id r13so4373151ljm.0
 for <iommu@lists.linux-foundation.org>; Sun, 30 Aug 2020 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w2b3uQ3grQuHzLpPQOfEHno6ki6zY9r+UONQurulOvI=;
 b=fhzf3GQjA1EtS/4zAwotNBVfEP5BgQC/vHh7NlqVuoqdj7ROn0tVvewLZVBzxTj4Pv
 4uAEsVCRdvMO7MN38yRhvjx55DRhviVUp+DeySquLtSENxd8LUNUq5mIKtUDp7268hWj
 EiAUYpoHBSpKqaW7iOB+cqshvXFhudBmVbsI7vuQfku+8lEdvR++g+KmaUBIrqUudFxn
 W8bUy8KkEXDCgYhxAAGz+7w9KmUMEitnB8JF5nbRsi/deNwUInd6AYGqmk3s0Ib8ljbl
 l0EyB1+767rr0k5EB5hEav1tXcXzg8p3RaCj4yuxNRG9oCWCo1/o1xG6lEcvfnnZFy/d
 3pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w2b3uQ3grQuHzLpPQOfEHno6ki6zY9r+UONQurulOvI=;
 b=pfWbOoEouhlUT6t38oCNT9575sTYCRl1mw4twXQMqk24BWE0/bOToXqXPJ3/y5xWVE
 zL3JXei5rcTV2hIsNEG3pG7HnoZA/+anC2ICXO7V/vo0cDNN61sAIc3x5qZ0To51/LjR
 Dpu7KQvhtiIRWIMJug/ivRPfnGRy3+dzwkR92SYgGUoPOmpwvnNN/NHRFNYOvCa2JBu8
 Z+a+4EdniUMHCxKZxDQApRjg0cz6c6laU4MnUR49QY0EsEFquMMsdTolkmH9OEX3NGNd
 7IM2AtK0rwS28o/8KpZ+27hT8yDqD3sRfIOSmWkBnrxZLpWhUxDbuZcywxwHvoN2HuDl
 Ge8w==
X-Gm-Message-State: AOAM531PpNNZJCS3jRQSL6zEXJG5DDauZrhZ22dQBqdYw+Ge+/ZaGx02
 JOGaPaTkRF0BLWhnajgaLF8=
X-Google-Smtp-Source: ABdhPJz59TfkPi8wlRB5m8RE5yjEcxQe68Z6X9P8P2LdznriMOncqOezMDUqioFbPNx1FbZLjJi8TA==
X-Received: by 2002:a05:651c:11c5:: with SMTP id
 z5mr3132694ljo.74.1598816680601; 
 Sun, 30 Aug 2020 12:44:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id e8sm1114886lja.93.2020.08.30.12.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 12:44:39 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
To: Thierry Reding <thierry.reding@gmail.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
 <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
 <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
 <affe2cfb-19e8-8e55-acd0-7170e274ab34@arm.com>
 <f1923a53-e799-e63c-fd22-4a6cca3b8212@gmail.com>
 <20200827155446.GB1660457@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6240633-feed-70b7-2fe8-49fcee687676@gmail.com>
Date: Sun, 30 Aug 2020 22:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827155446.GB1660457@ulmo>
Content-Language: en-US
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 will@kernel.org, hch@lst.de, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, linux@armlinux.org.uk, jonathanh@nvidia.com,
 agross@kernel.org, kyungmin.park@samsung.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

MjcuMDguMjAyMCAxODo1NCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKLi4uCj4+IFRoZSBU
ZWdyYSBEUk0gaGFzIGEgdmVyeSBzcGVjaWFsIHF1aXJrIGZvciBBUk0zMiB0aGF0IHdhcyBhZGRl
ZCBpbiB0aGlzCj4+IGNvbW1pdCBbMl0gYW5kIGRyaXZlciByZWxpZXMgb24gY2hlY2tpbmcgb2Yg
d2hldGhlciBleHBsaWNpdCBvciBpbXBsaWNpdAo+PiBJT01NVSBpcyB1c2VkIGluIG9yZGVyIHRv
IGFjdGl2YXRlIHRoZSBxdWlyay4KPj4KPj4gWzJdCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD0y
NzNkYTVhMDQ2OTY1Y2NmMGVjNzllYjYzZjJkNTE3MzQ2N2UyMGZhCj4+Cj4+IE9uY2UgdGhlIGlt
cGxpY2l0IElPTU1VIGlzIHVzZWQgZm9yIHRoZSBEUk0gZHJpdmVyLCB0aGUgcXVpcmsgbm8gbG9u
Z2VyCj4+IHdvcmtzIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKS4gVGhpcyBwcm9ibGVt
IG5lZWRzIHRvIGJlIHJlc29sdmVkCj4+IGJlZm9yZSBpbXBsaWNpdCBJT01NVSBjb3VsZCBiZSB1
c2VkIGJ5IHRoZSBUZWdyYSBEUk0gb24gQVJNMzIuCi4uLgo+IEkgZG8gaGF2ZSBhIHBhdGNoIGx5
aW5nIGFyb3VuZCBzb21ld2hlcmUgdGhhdCBpbXBsZW1lbnRzIHRoZSBtYXBwaW5nCj4gY2FjaGUg
dGhhdCB3YXMgcmVmZXJlbmNlZCBpbiB0aGUgYWJvdmUgY29tbWl0LiBMZXQgbWUga25vdyBpZiBJ
IHNob3VsZAo+IGRpZyB0aGF0IHVwIGFuZCBzZW5kIGl0IG91dC4KCkhlbGxvLCBUaGllcnJ5ISBJ
dCBjZXJ0YWlubHkgd2lsbCBiZSBpbnRlcmVzdGluZyB0byB0YWtlIGEgbG9vayBhdCB5b3Vycwpw
YXRjaCEKCkkgdGhpbmsgdGhhdCB0aGUgY2FjaGluZyBzaG91bGRuJ3QgYmUgc3RyaWN0bHkgbmVj
ZXNzYXJ5IGZvciBrZWVwaW5nIHRoZQpjdXJyZW50IHdvcmthcm91bmQgd29ya2luZyBhbmQgaXQg
c2hvdWxkIGJlIHBvc3NpYmxlIHRvIGtlZXAgdGhlIGNvZGUKYXMtaXMgYnkgcmVwbGFjaW5nIHRo
ZSBkb21haW4tdHlwZSBjaGVja2luZyB3aXRoIHRoZSBTb0MtZ2VuZXJhdGlvbgpjaGVjayBpbiB0
aGUgVGVncmEgRFJNIGRyaXZlci4KCkluIGdlbmVyYWwsIElNTyBpdCBzaG91bGQgYmUgYmV0dGVy
IHRvIHN0YXNoIHRoZSBjb21wbGV4IGNoYW5nZXMgdW50aWwKd2UnbGwgZ2V0IGNsb3NlciB0byBh
ZG9wdGluZyB0aGUgbmV3IFVBUEkgYXMgaXQgd2lsbCBjZXJ0YWlubHkgdG91Y2ggdGhlCmFzcGVj
dCBvZiB0aGUgcGVyLWRldmljZSBtYXBwaW5ncy4gQnV0IGlmIHlvdXJzIHBhdGNoIGlzIGxlc3Mg
dGhhbiAxMDAKTE9DLCB0aGVuIG1heWJlIHdlIGNvdWxkIGNvbnNpZGVyIGFwcGx5aW5nIGl0IHJp
Z2h0IG5vdyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
