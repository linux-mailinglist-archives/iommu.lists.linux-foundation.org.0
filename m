Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C524C6B0
	for <lists.iommu@lfdr.de>; Thu, 20 Aug 2020 22:16:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF4D7882E4;
	Thu, 20 Aug 2020 20:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aCvUGShtSrg1; Thu, 20 Aug 2020 20:16:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F0B7F882DE;
	Thu, 20 Aug 2020 20:16:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1AE6C0895;
	Thu, 20 Aug 2020 20:16:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDBE3C0051
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 20:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8257785FCB
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 20:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3Lgrztp9YIL for <iommu@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 20:16:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 44B3D85FB2
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 20:16:06 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id k13so1604786lfo.0
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z4/wj3Fu4Eph1sTO7GVhSlXHwAR3nCexyHHqjazhrhI=;
 b=eH0fXemGHyYrqVaXCSwoyiADThja4royuk8E2W7qgm+q+qNvxSE7WFI1GWAcUNWol5
 TkSlaIwWXfpGCu1rdKd4xbo6v5YOfOA1VqIE+e7I3KOFxP8uY8gZHQ5hEn18nNUkQltB
 61cD6GShkUj7anmSjHmNJJyQtWOSzcA/6WiCmvyl1yqsI+3JLWIFkxCEfZSA0Tkc4rwt
 Al0YwbiQoEnH/bE6QfOQS6mPRhuh/7eJUl9miYuu6EqyUaDTzmIFC9UVy73ZFdaDHzDh
 OoBwM1FfdFr2C2ppdWQEZQUf+F4zaBl1T3JBG+3PU5tvXyUEefM3HxjeLEu6sI20OYUe
 7V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z4/wj3Fu4Eph1sTO7GVhSlXHwAR3nCexyHHqjazhrhI=;
 b=Qhch0LTOe0vFRn4tnIl12nqWpj/EOHYo9kORhp4qmfLxr1d92iY+N6NsFDo/IrzePY
 5vaijHFVJb2lJPPwFTQkfjy+UUTm0Wl3kSPc4Kmt7dYdd65GenGSTcOXVWM9U0rldgXP
 62gHjhdm0U8lShFCsf5a4+Z0zsJoPV4EhhG16OyUVk8WNXVB1QYZ3+KjJFZNDWdF40u+
 9QzEPFbFfnJTsNq/mr6wvrD2Tv/ZFHyGlTIfIvGQEhHo2Pk2Zr496e21xa54DGVm0Fnp
 n2tu855a8L3wGPzSPUDcA5Almur+117qzWUKVYHg0AbJImLH0xxBQZAZ5yyTNTEYOPs7
 Br/w==
X-Gm-Message-State: AOAM533xVsuWIiLUQgk70FkbDq3IrkclzNcagZhf469MiTQkQZp2fgVf
 8q1bPwvQmFg+WQInp97Nr+s=
X-Google-Smtp-Source: ABdhPJwrxwMvfMIi1WMXou3rl8xDa6keRlOnRHgj5dYDGe39qslojpYQkA223xf57H7QsDS0Qr4vug==
X-Received: by 2002:a19:8a57:: with SMTP id m84mr30938lfd.159.1597954564373;
 Thu, 20 Aug 2020 13:16:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id b15sm638637lji.140.2020.08.20.13.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 13:16:03 -0700 (PDT)
Subject: Re: [PATCH 12/18] iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
References: <cover.1597931875.git.robin.murphy@arm.com>
 <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <081f7532-9ca0-0af3-35a1-cbaba0782237@gmail.com>
Date: Thu, 20 Aug 2020 23:16:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
Content-Language: en-US
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, will@kernel.org,
 linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 kyungmin.park@samsung.com, jonathanh@nvidia.com, agross@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 inki.dae@samsung.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
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

MjAuMDguMjAyMCAxODowOCwgUm9iaW4gTXVycGh5INC/0LjRiNC10YI6Cj4gTm93IHRoYXQgYXJj
aC9hcm0gaXMgd2lyZWQgdXAgZm9yIGRlZmF1bHQgZG9tYWlucyBhbmQgaW9tbXUtZG1hLAo+IGlt
cGxlbWVudCB0aGUgY29ycmVzcG9uZGluZyBkcml2ZXItc2lkZSBzdXBwb3J0IGZvciBETUEgZG9t
YWlucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2lvbW11L3RlZ3JhLWdhcnQuYyB8IDE3ICsrKysrKysrKysr
Ky0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3RlZ3JhLWdhcnQuYyBiL2RyaXZlcnMv
aW9tbXUvdGVncmEtZ2FydC5jCj4gaW5kZXggZmFjNzIwMjczODg5Li5lMDgxMzg3MDgwZjYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS90ZWdyYS1nYXJ0LmMKPiArKysgYi9kcml2ZXJzL2lv
bW11L3RlZ3JhLWdhcnQuYwo+IEBAIC05LDYgKzksNyBAQAo+ICAKPiAgI2RlZmluZSBkZXZfZm10
KGZtdCkJImdhcnQ6ICIgZm10Cj4gIAo+ICsjaW5jbHVkZSA8bGludXgvZG1hLWlvbW11Lmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+Cj4gQEAgLTE0NSwxNiArMTQ2LDIyIEBAIHN0YXRp
YyBzdHJ1Y3QgaW9tbXVfZG9tYWluICpnYXJ0X2lvbW11X2RvbWFpbl9hbGxvYyh1bnNpZ25lZCB0
eXBlKQo+ICB7Cj4gIAlzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW47CgpIZWxsbywgUm9iaW4h
CgpUZWdyYTIwIEdBUlQgaXNuJ3QgYSByZWFsIElPTU1VLCBidXQgYSBzbWFsbCByZWxvY2F0aW9u
IGFwZXJ0dXJlLiBXZQp3b3VsZCBvbmx5IHdhbnQgdG8gdXNlIGl0IGZvciBhIHRlbXBvcmFsIG1h
cHBpbmdzIChtYW5hZ2VkIGJ5IEdQVQpkcml2ZXIpIGZvciB0aGUgdGltZSB3aGlsZSBHUFUgaGFy
ZHdhcmUgaXMgYnVzeSBhbmQgd29ya2luZyB3aXRoIGEKc3BhcnNlIERNQSBidWZmZXJzLCB0aGUg
ZHJpdmVyIHdpbGwgdGFrZSBjYXJlIG9mIHVubWFwcGluZyB0aGUgc3BhcnNlCmJ1ZmZlcnMgb25j
ZSBHUFUgd29yayBpcyBmaW5pc2hlZCBbMV0uIEluIGEgY2FzZSBvZiBjb250aWd1b3VzIERNQQpi
dWZmZXJzLCB3ZSB3YW50IHRvIGJ5cGFzcyB0aGUgSU9NTVUgYW5kIHVzZSBidWZmZXIncyBwaHlz
IGFkZHJlc3MKYmVjYXVzZSBHQVJUIGFwZXJ0dXJlIGlzIHNtYWxsIGFuZCBhbGwgYnVmZmVycyBz
aW1wbHkgY2FuJ3QgZml0IGludG8KR0FSVCBmb3IgYSBjb21wbGV4IEdQVSBvcGVyYXRpb25zIHRo
YXQgaW52b2x2ZSBtdWx0aXBsZSBidWZmZXJzIFsyXVszXS4KVGhlIHVwc3RyZWFtIEdQVSBkcml2
ZXIgc3RpbGwgZG9lc24ndCBzdXBwb3J0IEdBUlQsIGJ1dCBldmVudHVhbGx5IGl0Cm5lZWRzIHRv
IGJlIGNoYW5nZWQuCgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL2dyYXRlLWRyaXZlci9saW51eC9i
bG9iL21hc3Rlci9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2FydC5jI0w0ODkKClsyXQpodHRwczov
L2dpdGh1Yi5jb20vZ3JhdGUtZHJpdmVyL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9nYXJ0LmMjTDU0MgoKWzNdCmh0dHBzOi8vZ2l0aHViLmNvbS9ncmF0ZS1kcml2ZXIv
bGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3VhcGkvcGF0Y2hpbmcuYyNM
OTAKCj4gLQlpZiAodHlwZSAhPSBJT01NVV9ET01BSU5fVU5NQU5BR0VEKQo+ICsJaWYgKHR5cGUg
IT0gSU9NTVVfRE9NQUlOX1VOTUFOQUdFRCAmJiB0eXBlICE9IElPTU1VX0RPTUFJTl9ETUEpCj4g
IAkJcmV0dXJuIE5VTEw7CgpXaWxsIGEgcmV0dXJuZWQgTlVMTCB0ZWxsIHRvIElPTU1VIGNvcmUg
dGhhdCBpbXBsaWNpdCBkb21haW4gc2hvdWxkbid0CmJlIHVzZWQ/IElzIGl0IHBvc3NpYmxlIHRv
IGxlYXZlIHRoaXMgZHJpdmVyIGFzLWlzPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vaW9tbXU=
