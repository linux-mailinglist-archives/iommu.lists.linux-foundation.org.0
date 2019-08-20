Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D03295B3B
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 11:41:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EBAC7E1A;
	Tue, 20 Aug 2019 09:41:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 22D3DDA4;
	Tue, 20 Aug 2019 09:41:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F3A7C12E;
	Tue, 20 Aug 2019 09:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tzn5bK3tbNsiWgQGYaxZl6ZSSnLs1CWcQlXNKSbagq0=;
	b=jtXhyGX6RFLZEXfdyxYVaGpe7i
	I/AIX1W2McUPBTSwD0AEExmIXaKs7T/fIXSvjRG9kjWzst6hw31JyidJKj3OnAqbVy7OoQF/YNdLD
	QA34nygptFZu9wBF719DF7LO08ZjfsRjQyv6gnpDJAkmyvN5MXR+4+1Z/nZ/5gjL3bP8LD6tXWlC5
	PQuG95sOBNDun+y68Cpf9cO5wVDzDh73H1dXlwirbKgiXPhdkErbRar31Yc7Pkg9mF/EgBGp+hSaD
	YbrMNB3jYijcgcG1q0gx5az//hgZ2bDfcUWSSp0lOzKaGK32UhjMRis8aNos8ZhcQbVF/K0oEtw2i
	HEJANvzg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1i00e7-0008Ol-OL; Tue, 20 Aug 2019 09:41:43 +0000
Date: Tue, 20 Aug 2019 02:41:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tom Murphy <murphyt7@tcd.ie>
Subject: Re: [PATCH V5 1/5] iommu/amd: Remove unnecessary locking from AMD
	iommu driver
Message-ID: <20190820094143.GA24154@infradead.org>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
	<20190815110944.3579-2-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815110944.3579-2-murphyt7@tcd.ie>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-s390@vger.kernel.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6MDk6MzlQTSArMDEwMCwgVG9tIE11cnBoeSB3cm90
ZToKPiBXZSBjYW4gcmVtb3ZlIHRoZSBtdXRleCBsb2NrIGZyb20gYW1kX2lvbW11X21hcCBhbmQg
YW1kX2lvbW11X3VubWFwLgo+IGlvbW11X21hcCBkb2VzbuKAmXQgbG9jayB3aGlsZSBtYXBwaW5n
IGFuZCBzbyBubyB0d28gY2FsbHMgc2hvdWxkIHRvdWNoCj4gdGhlIHNhbWUgaW92YSByYW5nZS4g
VGhlIEFNRCBkcml2ZXIgYWxyZWFkeSBoYW5kbGVzIHRoZSBwYWdlIHRhYmxlIHBhZ2UKPiBhbGxv
Y2F0aW9ucyB3aXRob3V0IGxvY2tzIHNvIHdlIGNhbiBzYWZlbHkgcmVtb3ZlIHRoZSBsb2Nrcy4K
CkkndmUgYmVlbiBsb29raW5nIG92ZXIgdGhlIGNvZGUgYW5kIHRyeWluZyB0byB1bmRlcnN0YW5k
IGhvdyB0aGUKc3luY2hyb25pemF0aW9uIHdvcmtzLiAgSSBndWVzIHdlIHRoZSBjbXB4Y2hnNjQg
aW4gZnJlZV9jbGVhcl9wdGUKaXMgdGhlIGltcG9ydGFudCBwb2ludCBoZXJlPyAgSSBoYXZlIHRv
IGFkbWl0IEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZAp0aGUgY29uY3VycmVuY3kgaXNzdWVzIGhl
cmUsIGJ1dCBuZWl0aGVyIGRvIEkgdW5kZXJzdGFuZCB3aGF0IHRoZQptdXRleCB5b3UgcmVtb3Zl
ZCBtaWdodCBoYXZlIGhlbHBlZCB0byBzdGFydCB3aXRoLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vaW9tbXU=
