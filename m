Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885E129A34
	for <lists.iommu@lfdr.de>; Mon, 23 Dec 2019 20:01:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8885858AE;
	Mon, 23 Dec 2019 19:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nge0c9YgkZfH; Mon, 23 Dec 2019 19:00:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DCFED85629;
	Mon, 23 Dec 2019 19:00:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9673C0881;
	Mon, 23 Dec 2019 19:00:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D8F5C0881;
 Mon, 23 Dec 2019 19:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 190A4878F1;
 Mon, 23 Dec 2019 19:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kjZDkqwigcz; Mon, 23 Dec 2019 19:00:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 724368781C;
 Mon, 23 Dec 2019 19:00:54 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v18so17109490iol.2;
 Mon, 23 Dec 2019 11:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=5WjW3vD2cx3BUd8M8ubJSzV7k9hmJV/MjBgFD4V36+U=;
 b=SfdIJwjQd53LNcv5/C/cr6A9iEyMN7mtz3lYF9IKVOqEJF4K/GVWvOWQb1Kcd791wO
 78vVQCVClSM/UdNaSwbCDwWR2jbpSt6wIcGgF6Fmr0HxzOX+mFetSE5kyXy1IHA0B2my
 DoJQiMO+vOPmtRaInuM2Fwt72TC1vzyknqOYRgvk/JLMKeP2yIX4+ZuP/VDK8u4fzpYj
 URmGVaJLjdvXbrgjsALnwGUzPTgVQ7B7JftpvLnvVhxko3Eh3aiesJmQE3pannLAC87a
 RehuChGYDJbbt7hUZrQ6xHXdrCoGMGIZWB6SbrjJ5yzrICvMwvOAcdqO+6iyhfQkVpyJ
 graQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=5WjW3vD2cx3BUd8M8ubJSzV7k9hmJV/MjBgFD4V36+U=;
 b=RhdXY8MvDe0I5f8UnU0ggQTFYZHNYQ8CHhkRR8y/t6RIqIdglxNmIiWQoBYQuSyYF7
 PqBmiDCO1Is/OH4j6qKicEFPk+vJUYvBk0iwHVXpuPh+y9ruyxD7Hrc38oU8e7sJdEmO
 ltmS9TAR9nYOSBbTH2AZIHNrriM32CMKovc8mjw+WYDwe9WRt0AGFMGmi4jSrTOoE0Qb
 nASGvcjV7yfvJFNGLrS+npp4MGHou6BzbtzjV+vo1if6D/p7OBvCpTHRtj6B+LD/1Nnd
 ARmqDpeXNCHWwHDrDFiDhMF6ELAGgPj9OFarmBkCOtl+yDB8hJhGEYhWK8Ik0coM8fo0
 9SvA==
X-Gm-Message-State: APjAAAUEbeyBUf3WG1qv97sUGJdHrWb/RhHykhGGHJFllCSEz9TVPXV3
 cHe7S/7JQ5BSOe+puxwZ0+/zLmqqfIaqE2jWq0Q=
X-Google-Smtp-Source: APXvYqwaFZg7aCu6nzs0ZutPtYsj9R32aQwWIh0wX+JYOxpu64SuDTLXdlqTyVyvXRJJzV59D2yYDwSiSzYDcnKN32Y=
X-Received: by 2002:a6b:b941:: with SMTP id j62mr22074614iof.168.1577127653723; 
 Mon, 23 Dec 2019 11:00:53 -0800 (PST)
MIME-Version: 1.0
References: <20191223185918.9877-1-tiny.windzz@gmail.com>
 <20191223185918.9877-2-tiny.windzz@gmail.com>
In-Reply-To: <20191223185918.9877-2-tiny.windzz@gmail.com>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Tue, 24 Dec 2019 03:00:42 +0800
Message-ID: <CAEExFWu771PdyjqHa3vF5W46ch_YecE6Dvv8iF42r5799yuF7A@mail.gmail.com>
Subject: Re: [PATCH] virtio-mmio: convert to devm_platform_ioremap_resource
To: m.szyprowski@samsung.com, joro@8bytes.org, Kukjin Kim <kgene@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, agross@kernel.org, 
 bjorn.andersson@linaro.org, Rob Clark <robdclark@gmail.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, mst@redhat.com, 
 jasowang@redhat.com, iommu@lists.linux-foundation.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Please ignore this patch.

Thx!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
