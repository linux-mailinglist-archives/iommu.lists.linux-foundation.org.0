Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E285304909
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 20:49:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5575485C43;
	Tue, 26 Jan 2021 19:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFEcDUQD388I; Tue, 26 Jan 2021 19:49:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56FAB85C28;
	Tue, 26 Jan 2021 19:49:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D635C013A;
	Tue, 26 Jan 2021 19:49:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27356C013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 19:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0CF00204A9
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 19:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fKTd-63Toj3 for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 19:49:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by silver.osuosl.org (Postfix) with ESMTPS id 3754420479
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 19:49:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id w1so24681134ejf.11
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 11:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o/xNlPfGwnBKxfph+ywxuqzSguELReNCQiSKkwp5El8=;
 b=fH3RclTEH5KR+ZimDoNm65i7tRh/ojyFFNZKtq3IIsUiQCysuQ9Lq9ZH23QeeWFGp3
 BNPajTZqKDjfAgI6ftdSgbLnzvsfxX5lDbteTH5mE43jil128wTkJEqVC7WQw6Mve7ZL
 1wZ8dylSspJxnU/PqWcPYlOjSAs/tSUMVMX9wSy3QniFd4LSxi60Y3PSB+TUMfKMHVgn
 yRKb5rMjofmHvYKOHcpRIAXco4dbURj9vSWOdqUnocovUnFaxMlqj2pk4dux/WBXePLF
 azUVEGO5TIC5zTNnJMBzU7kNQ8doaxbBOCutsUZjo2Rt0tH7ovrRVs6PQnbMSB4BbYkq
 +fLg==
X-Gm-Message-State: AOAM533TzLDMIPl0QON6PbO2h7H2NjfWVCfpldT2qNZDPRx8RiA2Hv07
 7ta4859T2FKouqVIteeRo08=
X-Google-Smtp-Source: ABdhPJxK7hEpk5TYCend9Ub0Pc+g5IwKSV+LIkJ84QXUrE7AdhDzU/Qs2jCac4uMCvi4wSJ7Mt+SmQ==
X-Received: by 2002:a17:906:2e0d:: with SMTP id
 n13mr4302953eji.554.1611690586670; 
 Tue, 26 Jan 2021 11:49:46 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id dj25sm12801834edb.5.2021.01.26.11.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 11:49:45 -0800 (PST)
Date: Tue, 26 Jan 2021 20:49:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2] memory: mtk-smi: Support SMI modular
Message-ID: <20210126194943.n7xtgoa5axd2zajz@kozik-lap>
References: <20210126060055.11050-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126060055.11050-1-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 yi.kuo@mediatek.com, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Jan 26, 2021 at 02:00:55PM +0800, Yong Wu wrote:
> This patch mainly support SMI modular. Switch MTK_SMI to tristate,
> and add module_exit/module_license.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> This patch rebase on the clean v5.11-rc1.
> and this one: memory: mtk-smi: Use platform_register_drivers
> https://lore.kernel.org/linux-arm-kernel/20210121062429.26504-2-yong.wu@mediatek.com/
> 
> change note:
> a) squash the last two of v1 into one patch.
> b) Remove module_alias
> ---
>  drivers/memory/Kconfig     | 2 +-
>  drivers/memory/mtk-smi.c   | 9 +++++++++
>  include/soc/mediatek/smi.h | 2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)

Thanks, applied with slightly adjusted commit msg and subject.

Best regards,
Krzysztof

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
